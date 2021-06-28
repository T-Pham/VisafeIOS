//
//  AddDeviceToGroupParam.swift
//  visafe
//
//  Created by Cuong Nguyen on 6/28/21.
//

import UIKit
import ObjectMapper

class AddDeviceToGroupParam: NSObject, Mappable {
    var deviceId: String?
    var groupId: String?
    var groupName: String?
    var deviceName: String?
    var macAddress: String?
    var ipAddress: String?
    var deviceType: String?
    var deviceOwner: String?
    var deviceDetail: String?
    
    override init() {
        super.init()
    }

    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        deviceId <- map["deviceId"]
        groupId <- map["groupId"]
        groupName <- map["groupName"]
        deviceName <- map["deviceName"]
        macAddress <- map["macAddress"]
        ipAddress <- map["ipAddress"]
        deviceType <- map["deviceType"]
        deviceOwner <- map["deviceOwner"]
        deviceDetail <- map["deviceDetail"]
    }
}
