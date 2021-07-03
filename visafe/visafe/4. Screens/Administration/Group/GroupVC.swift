//
//  GroupVC.swift
//  visafe
//
//  Created by Cuong Nguyen on 6/22/21.
//

import UIKit

class GroupVC: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var groups: [GroupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        prepareData()
    }
    
    func configView() {
        // tableview
        tableView.registerCells(cells: [GroupCell.className])
    }
    
    func showFormAddGroup() {
        let vc = PostGroupVC()
        let nav = BaseNavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
    
    func prepareData() {
        showLoading()
        let workspace = CacheManager.shared.getCurrentWorkspace()
        GroupWorker.list(wsid: workspace?.id) { [weak self] (result, error) in
            guard let weakSelf = self else { return }
            weakSelf.hideLoading()
            weakSelf.groups = result?.clients ?? []
            weakSelf.tableView.reloadData()
        }
    }
    
    func refreshData() {
        let workspace = CacheManager.shared.getCurrentWorkspace()
        GroupWorker.list(wsid: workspace?.id) { [weak self] (result, error) in
            guard let weakSelf = self else { return }
            weakSelf.groups = result?.clients ?? []
            weakSelf.tableView.reloadData()
        }
    }
}

extension GroupVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.className) as? GroupCell else {
            return UITableViewCell()
        }
        cell.bindingData(group: groups[indexPath.row])
        cell.onMoreAction = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.showMoreAction(group: weakSelf.groups[indexPath.row])
        }
        return cell
    }
    
    func showMoreAction(group: GroupModel) {
        guard let view = MoreGroupActionView.loadFromNib() else { return }
        view.nameLabel.text = group.name
        view.editAction = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.editGroup(group: group)
        }
        view.deleteAction = { [weak self] in
            guard let weakSelf = self else { return }
            Timer.scheduledTimer(timeInterval: 0.3, target: weakSelf, selector:#selector(weakSelf.deleteGroup(sender:)), userInfo: group , repeats:false)
        }
        showPopup(view: view)
    }
    
    func editGroup(group: GroupModel) {
        let vc = PostGroupVC(group: group)
        let nav = BaseNavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
    
    @objc func deleteGroup(sender: Timer) {
        guard let group = sender.userInfo as? GroupModel else { return }
        showConfirmDelete(title: "Bạn có chắc chắn muốn xoá nhóm \(group.name ?? "") không?") { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.actionDeleteGroup(group: group)
        }
    }
    
    func actionDeleteGroup(group: GroupModel) {
        guard let groupId = group.groupid else { return }
        guard let userId = group.fkUserId else { return }
        showLoading()
        GroupWorker.delete(groupId: groupId, userId: userId) { [weak self] (result, error) in
            guard let weakSelf = self else { return }
            weakSelf.hideLoading()
            weakSelf.refreshData()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = GroupFooterView.loadFromNib()
        footerView?.isUserInteractionEnabled = true
        footerView?.configView()
        footerView?.onClickAddGroup = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.showFormAddGroup()
        }
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 84
    }
}

