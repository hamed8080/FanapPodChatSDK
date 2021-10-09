//
//  ChatDataDTO.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 6/29/21.
//

import Foundation
public struct ChatDataDTO :Codable {
    
    public let sendMetaData       : String
    public let screenShare        : String
    public let reciveMetaData     : String
    public let turnAddress        : String
    public let brokerAddress      : String
    public let brokerAddressWeb   : String
    public let kurentoAddress     : String
    
    public init(sendMetaData: String, screenShare: String, reciveMetaData: String, turnAddress: String, brokerAddress: String, brokerAddressWeb: String, kurentoAddress: String) {
        self.sendMetaData     = sendMetaData
        self.screenShare      = screenShare
        self.reciveMetaData   = reciveMetaData
        self.turnAddress      = turnAddress
        self.brokerAddress    = brokerAddress
        self.brokerAddressWeb = brokerAddressWeb
        self.kurentoAddress   = kurentoAddress
    }

    private enum CodingKeys:String , CodingKey{
        case sendMetaData       = "sendMetaData"
        case screenShare        = "screenShare"
        case reciveMetaData     = "reciveMetaData"
        case turnAddress        = "turnAddress"
        case brokerAddress      = "brokerAddress"
        case brokerAddressWeb   = "brokerAddressWeb"
        case kurentoAddress     = "kurentoAddress"
    }
    
    public init(from decoder: Decoder) throws {
        let container    = try decoder.container(keyedBy: CodingKeys.self)
        sendMetaData     = try container.decode(String.self, forKey: .sendMetaData)
        screenShare      = try container.decode(String.self, forKey: .screenShare)
        reciveMetaData   = try container.decode(String.self, forKey: .reciveMetaData)
        
        if let firstTurnAddress      = try container.decode(String.self, forKey: .turnAddress).split(separator: ",").first{
            turnAddress = String(firstTurnAddress)
        }else{
            turnAddress = ""
        }
        
        if let firstBrokerAddress = try container.decode(String.self, forKey: .brokerAddress).split(separator: ",").first{
            brokerAddress    = String(firstBrokerAddress)
        }else{
            brokerAddress = ""
        }
        
        if let firstBrokerAddressWeb = try container.decode(String.self, forKey: .brokerAddressWeb).split(separator: ",").first{
            brokerAddressWeb    = String(firstBrokerAddressWeb)
        }else{
            brokerAddressWeb    = ""
        }
        
        if let firstKurentoAddress   = try container.decode(String.self, forKey: .kurentoAddress).split(separator: ",").first{
            kurentoAddress = String(firstKurentoAddress)
        }else{
            kurentoAddress = ""
        }
    }
}