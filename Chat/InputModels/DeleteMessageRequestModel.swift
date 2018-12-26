//
//  DeleteMessageRequestModel.swift
//  Chat
//
//  Created by Mahyar Zhiani on 10/1/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON

open class DeleteMessageRequestModel {
    
    public let subjectId:           Int?
    public let deleteForAll:        JSON
    public let uniqueId:            String?
    public let typeCode:            String?
    
    public init(subjectId:         Int?,
                deleteForAll:      JSON,
                uniqueId:          String?,
                typeCode:          String?) {
        
        self.subjectId          = subjectId
        self.deleteForAll       = deleteForAll
        self.uniqueId           = uniqueId
        self.typeCode           = typeCode
    }
    
}
