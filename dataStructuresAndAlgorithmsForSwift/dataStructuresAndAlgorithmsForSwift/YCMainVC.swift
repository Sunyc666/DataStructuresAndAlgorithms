//
//  YCMainVC.swift
//  dataStructuresAndAlgorithmsForSwift
//
//  Created by Sunyc on 2025/2/18.
//  Copyright © 2025 cys. All rights reserved.
//

import UIKit

class YCMainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var sourceArr:[[String:Any]] = []
    
    private lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(YCPublicTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(YCPublicTableViewCell.self))
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        configData()
    }

    func setupUI() {
        title = "ABC"
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    func configData() {
        // 链表
        configLinkedList()
        
        // 刷新数据
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(YCPublicTableViewCell.self), for: indexPath) as! YCPublicTableViewCell
        cell.cellTitleLab.text = sourceArr[indexPath.row]["title"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 获取选中行对应的数据
        let rowData = sourceArr[indexPath.row]
        let subArr:[[String:Any]] = rowData["subArr"] as! [[String : Any]]
        let clsName:String = rowData["target"] as! String
        if let clssType = clsName.classFromString() as? YCBaseViewController.Type {
            if subArr.count > 0 {
                let targetVC: YCBaseViewController = clssType.init()
                targetVC.sourceArr = subArr
                if let title = rowData["title"] as? String {
                    targetVC.title = title
                }
                navigationController?.pushViewController(targetVC, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    private func configLinkedList() {
        let item : [String : Any] = [
            "title":"链表",
            "target":"YCBaseViewController",
            "subArr":[
                [
                    "title":"反转链表",
                    "target":"YCLinkedListReversalVC"
                ],
                [
                    "title":"有序链表合并（升序）",
                    "target":"YCLinkedListAscendingMergeVC"
                ],
                [
                    "title":"相交链表",
                    "target":"YCLinkedListIntersectVC"
                ],
                [
                    "title":"删除链表的倒数第N个节点",
                    "target":"YCDeleteCountBackwardsVC"
                ],
                [
                    "title":"回文链表",
                    "target":"YCPalindromeLinkedListVC"
                ]
            ]
        ]
        
        sourceArr.append(item)
    }


}

