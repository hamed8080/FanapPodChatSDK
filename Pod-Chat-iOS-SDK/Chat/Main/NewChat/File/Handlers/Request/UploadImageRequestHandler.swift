//
//  UploadImageRequestHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 3/31/21.
//

import Foundation
class UploadImageRequestHandler{
    
    class func uploadImage(_ chat:Chat,
                           _ req:NewUploadImageRequest,
                           _ uploadCompletion: UploadCompletionType? = nil,
                           _ uploadProgress:UploadFileProgressType? = nil,
                           _ uploadUniqueIdResult :UniqueIdResultType = nil){
        
        uploadUniqueIdResult?(req.uniqueId)
        guard let fileServer = chat.config?.fileServer else {return}
        let imagePath:SERVICES_PATH = req.userGroupHash != nil ? .PODSPACE_PUBLIC_UPLOAD_IMAGE : .PODSPACE_UPLOAD_IMAGE
        let url = fileServer + imagePath.rawValue
        guard let token = chat.config?.token , let parameters = try? req.asDictionary() else{return}
        let headers = ["_token_":  token, "_token_issuer_": "1", "Content-type": "multipart/form-data"]
        
        CacheFactory.write(cacheType: .UPLOAD_IMAGE_QUEUE(req))
        PSM.shared.save()
        
        UploadManager.upload(url: url,
                             headers: headers,
                             parameters: parameters,
                             fileData: req.data,
                             fileName: req.fileName,
                             mimetype: req.mimeType,
                             uniqueId: req.uniqueId,
                             uploadProgress: uploadProgress) { data , response , error in
            if let data = data , let chatError = try? JSONDecoder().decode(ChatError.self, from: data) , chatError.hasError == true{
                uploadCompletion?(nil,nil,chatError)
            }else if let data = data , let uploadResponse = try? JSONDecoder().decode(NewUploadFileResponse.self, from: data){
                if FanapPodChatSDK.Chat.sharedInstance.config?.isDebuggingLogEnabled == true {
                    print("file uploaded successfully:\(String(data:data , encoding:.utf8) ?? "")")
                }
                guard let fileServer = chat.config?.fileServer else {return}
                let link = "\(fileServer)\(SERVICES_PATH.DRIVE_DOWNLOAD_FILE.rawValue)?hash=\(uploadResponse.fileMetaDataResponse?.hashCode ?? "")"
                let fileDetail   = FileDetail(fileExtension: req.fileExtension,
                                              link: link,
                                              mimeType: req.mimeType,
                                              name: req.fileName,
                                              originalName: req.originalName,
                                              size: req.fileSize,
                                              fileHash: uploadResponse.fileMetaDataResponse?.hashCode,
                                              hashCode: uploadResponse.fileMetaDataResponse?.hashCode,
                                              parentHash: uploadResponse.fileMetaDataResponse?.parentHash,
                                              actualHeight: req.hC,
                                              actualWidth: req.wC )
                let fileMetaData = FileMetaData(file: fileDetail, fileHash: uploadResponse.fileMetaDataResponse?.hashCode, hashCode: uploadResponse.fileMetaDataResponse?.hashCode , name: uploadResponse.fileMetaDataResponse?.name)
                uploadCompletion?(uploadResponse , fileMetaData , nil)
                CacheFactory.write(cacheType: .DELETE_UPLOAD_IMAGE_QUEUE(req.uniqueId))
                PSM.shared.save()
            }else if let error = error {
                let error = ChatError(message: "\(ChatErrors.err6200.stringValue()) \(error)", errorCode: 6200, hasError: true)
                uploadCompletion?(nil,nil,error)
            }
        }
    }
    
}