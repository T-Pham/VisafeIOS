//
//  GroupWorker.swift
//  visafe
//
//  Created by Cuong Nguyen on 6/28/21.
//

import UIKit
import Foundation
import ObjectMapper
import SwiftyJSON

class GroupWorker {
    
    static func add(group: GroupModel, completion: @escaping (_ result: GroupModel?, _ error: Error?) -> Void) {
        let router = APIRouter.addGroup(param: group)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: GroupModel?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<GroupModel>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func update(group: GroupModel, completion: @escaping (_ result: GroupModel?, _ error: Error?) -> Void) {
        group.usersGroupInfo = []
        let router = APIRouter.updateGroup(param: group)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: GroupModel?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<GroupModel>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func rename(param: RenameGroupParam, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.updateNameGroup(param: param)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func list(wsid: String?, completion: @escaping (_ result: ListGroupResult?, _ error: Error?) -> Void) {
        let router = APIRouter.getGroups(wspId: wsid ?? "")
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var result: ListGroupResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    result = Mapper<ListGroupResult>().map(JSONObject: json)
                } catch { }
            }
            completion(result, error)
        }
    }
    
    static func delete(groupId: String, userId: Int, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.deleteGroup(groupId: groupId, fkUserId: userId)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func addDevice(param: AddDeviceToGroupParam, completion: @escaping (_ result: InviteDeviceResult?, _ error: Error?) -> Void) {
        let router = APIRouter.addDeviceGroup(param: param)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: InviteDeviceResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<InviteDeviceResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func updateDevice(param: AddDeviceToGroupParam, completion: @escaping (_ result: InviteDeviceResult?, _ error: Error?) -> Void) {
        let router = APIRouter.updateDeviceGroup(param: param)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: InviteDeviceResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<InviteDeviceResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func deleteDevice(param: DeleteDeviceToGroupParam, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.deleteDeviceGroup(param: param)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func createIdentifier(name: String, groupId: String, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.createIdentifier(name: name, groupId: groupId)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func updateIdentifier(name: String, groupId: String, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.updateIdentifier(name: name, groupId: groupId)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func deleteIdentifier(id: String, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.deleteIdentifier(id: id)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func getIdentifier(id: String, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.getIdentifier(id: id)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func addDeviceToIdentifier(param: AddDeviceToIdentifierParam, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.addDeviceToIden(param: param)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func deleteDeviceToIdentifier(param: DeleteDeviceToIdentifierParam, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.deleteDeviceToIden(param: param)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func inviteToGroup(param: InviteToGroupParam, completion: @escaping (_ result: InviteMemberResult?, _ error: Error?) -> Void) {
        let router = APIRouter.inviteToGroup(param: param)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: InviteMemberResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<InviteMemberResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func deleteToGroup(param: DeleteToGroupParam, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.deleteGroupMember(param: param)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func changeManagerPermision(param: ChangeManagerPermisionParam, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.changeManagerPermision(param: param)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func changeViewerPermision(param: ChangeViewerPermisionParam, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.changeViewerPermision(param: param)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func getStatistic(grId: String, limit: Int, completion: @escaping (_ result: StatisticModel?, _ error: Error?) -> Void) {
        let router = APIRouter.statisticGroup(id: grId, limit: limit)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: StatisticModel?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<StatisticModel>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func updateWhitelist(param: GroupUpdateWhitelistParam, completion: @escaping (_ result: GroupModel?, _ error: Error?) -> Void) {
        let router = APIRouter.groupUpdateWhitelist(param: param)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: GroupModel?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<GroupModel>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func groupUserManager(userId: Int?, groupId: String?, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.groupUserToManager(userId: userId, groupId: groupId)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func groupUserViewer(userId: Int?, groupId: String?, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.groupUserToViewer(userId: userId, groupId: groupId)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func groupDeleteUser(userId: Int?, groupId: String?, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.groupDeleteUser(userId: userId, groupId: groupId)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func getLog(param: QueryLogParam, completion: @escaping (_ result: QueryLogResult?, _ error: Error?) -> Void) {
        let router = APIRouter.logGroup(param: param)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: QueryLogResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<QueryLogResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func deleteLog(groupId: String?, logId: String?, completion: @escaping (_ result: BaseResult?, _ error: Error?) -> Void) {
        let router = APIRouter.deleteLog(group_id: groupId, logId: logId)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BaseResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BaseResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func getGroup(id: String, completion: @escaping (_ result: GroupModel?, _ error: Error?) -> Void) {
        let router = APIRouter.getGroup(id: id)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: GroupModel?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<GroupModel>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func checkBotNet(completion: @escaping (_ result: BotNetModel?, _ error: Error?) -> Void) {
        let router = APIRouter.checkBotNet
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: BotNetModel?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<BotNetModel>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func getNewestiOSVersion(name: String,
                                    completion: @escaping (_ result: VersioniOSModel?,
                                                           _ error: Error?) -> Void) {
        let router = APIRouter.iosVersion(name: name)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: VersioniOSModel?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<VersioniOSModel>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func checkDevice(completion: @escaping (_ result: DeviceCheckResult?,
                                                   _ error: Error?) -> Void) {
        let router = APIRouter.checkDevice
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: DeviceCheckResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<DeviceCheckResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func requestOutGroup(groupId: String,
                                completion: @escaping (_ result: LeaveGroupResult?,
                                                       _ error: Error?) -> Void) {
        let router = APIRouter.requestOutGroup(groupId: groupId)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: LeaveGroupResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<LeaveGroupResult>().map(JSONObject: json)
                } catch { }
            }
            completion(loginResult, error)
        }
    }
    
    static func activeVip(key: String,
                                completion: @escaping (_ result: ActiveVipResult?,
                                                       _ error: Error?) -> Void) {
        let router = APIRouter.activeVip(key: key)
        APIManager.shared.request(target: router) { (data, error, statusCode) in
            var loginResult: ActiveVipResult?
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    loginResult = Mapper<ActiveVipResult>().map(JSONObject: json)
                    loginResult?.responseCode = statusCode
                } catch { }
            }
            completion(loginResult, error)
        }
    }
}
