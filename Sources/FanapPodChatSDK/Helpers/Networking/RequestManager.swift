//
// RequestManager.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation
class RequestManager {
    class func request<D: Decodable>(ofType: D.Type,
                                     bodyData: Data?,
                                     url: String,
                                     method: HTTPMethod,
                                     headers: [String: String]?,
                                     completion: @escaping CompletionTypeWithoutUniqueId<D>)
    {
        guard let url = URL(string: url) else { Chat.sharedInstance.logger?.log(title: "could not open url, it was nil"); return }

        let session = URLSession(configuration: .default)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = bodyData
        printRequestDebug(urlRequest, ofType)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            printResponseDebug(data, response, error)
            guard let httpResponse = response as? HTTPURLResponse else { return }

            DispatchQueue.main.async {
                if let data = data, let chatError = try? JSONDecoder().decode(ChatError.self, from: data), chatError.hasError == true {
                    completion(nil, chatError)
                } else if httpResponse.statusCode >= 200, httpResponse.statusCode <= 300, let data = data, let codable = try? JSONDecoder().decode(D.self, from: data) {
                    completion(codable, nil)
                } else if let error = error {
                    let error = ChatError(message: "\(ChatErrorCodes.networkError.rawValue) \(error)", errorCode: httpResponse.statusCode, hasError: true)
                    completion(nil, error)
                } else {
                    let error = ChatError(message: "\(ChatErrorCodes.networkError.rawValue)", errorCode: httpResponse.statusCode, hasError: true)
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }

    private class func printRequestDebug<D: Decodable>(_ request: URLRequest, _: D.Type) {
        if Chat.sharedInstance.config?.isDebuggingLogEnabled == true {
            var output = "\n"
            output += "Start Of Request============================================================================================\n"
            output += " REST Request With Method:\(request.httpMethod ?? "") - url:\(request.url?.absoluteString ?? "")\n"
            output += " With Headers:\(request.allHTTPHeaderFields?.debugDescription ?? "[]")\n"
            output += " With HttpBody:\(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "nil")\n"
            output += " Expected DecodeType:\(String(describing: D.self))\n"
            output += "End  Of  Request============================================================================================\n"
            output += "\n"
            Chat.sharedInstance.logger?.log(title: "CHAT_SDK:", message: output)
        }
    }

    private class func printResponseDebug(_ data: Data?, _ response: URLResponse?, _: Error?) {
        if Chat.sharedInstance.config?.isDebuggingLogEnabled == true {
            var output = "\n"
            output += "Start Of Response============================================================================================\n"
            output += " REST Response For url:\(response?.url?.absoluteString ?? "")\n"
            output += " With Data Result in Body:\(String(data: data ?? Data(), encoding: .utf8) ?? "nil")\n"
            output += "End  Of  Response============================================================================================\n"
            output += "\n"
            Chat.sharedInstance.logger?.log(title: "CHAT_SDK:", message: output)
        }
    }
}
