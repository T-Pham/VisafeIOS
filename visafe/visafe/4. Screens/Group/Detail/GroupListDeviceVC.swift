//
//  GroupListDeviceVC.swift
//  visafe
//
//  Created by Cuong Nguyen on 7/24/21.
//

import UIKit

class GroupListDeviceVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var group: GroupModel
    var listDevice: [DeviceGroupModel] = []
    
    init(group: GroupModel) {
        self.group = group
        listDevice = group.devicesGroupInfo
        super.init(nibName: GroupListDeviceVC.className, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Quản lý thiết bị"
        tableView.registerCells(cells: [GroupDeviceCell.className])
        tableView.reloadData()
    }
}

extension GroupListDeviceVC: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            return listDevice.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupDeviceCell.className) as? GroupDeviceCell else {
            return UITableViewCell()
        }
        let device = listDevice[indexPath.row]
        cell.binding(device: device)
        cell.moreAction = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.showMoreAction(device: device)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let view = BaseAddView.loadFromNib() else { return UIView() }
            view.bindingInfo(type: .device)
            view.addAction = { [weak self] in
                guard let weakSelf = self else { return }
            }
            return view
        } else {
            if listDevice.count == 0 { return UIView() }
            let viewHeader = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 48))
            viewHeader.backgroundColor = UIColor.white
            let label = UILabel(frame: CGRect(x: 16, y: 6, width: kScreenWidth - 32, height: 48))
            label.text = "\(listDevice.count) thiết bị"
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            viewHeader.addSubview(label)
            return viewHeader
        }
        
    }
    
    func showMoreAction(device: DeviceGroupModel) {
        guard let view = MoreActionView.loadFromNib() else { return }
        view.binding(title: device.deviceName ?? "", type: .device)
        view.deleteAction = { [weak self] in
            guard let weakSelf = self else { return }
            Timer.scheduledTimer(timeInterval: 0.3, target: weakSelf, selector:#selector(weakSelf.confirmDeleteDevice(sender:)), userInfo: device, repeats:false)
        }
        view.editAction = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.editDevice(device: device)
        }
        showPopup(view: view)
    }
    
    @objc func confirmDeleteDevice(sender: Timer) {
        guard let devcie = sender.userInfo as? DeviceGroupModel else { return }
        showConfirmDelete(title: "Bạn có chắc chắn muốn xóa thiết bị \(devcie.deviceName ?? "") khỏi nhóm?") { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.deleteDevice(device: devcie)
        }
    }
    
    func deleteDevice(device: DeviceGroupModel) {
        showLoading()
        let param = DeleteDeviceToGroupParam()
        param.groupId = group.groupid
        param.deviceId = device.deviceID
        param.deviceMonitorID = device.deviceMonitorID
        GroupWorker.deleteDevice(param: param) { [weak self] (result, error) in
            guard let weakSelf = self else { return }
            weakSelf.hideLoading()
            
        }
    }
    
    func editDevice(device: DeviceGroupModel) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 72
        } else {
            if listDevice.count == 0 { return 0.0001 }
            return 48
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
}
