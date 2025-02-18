//
//  YCBaseViewController.swift
//  dataStructuresAndAlgorithmsForSwift
//
//  Created by Sunyc on 2025/2/18.
//  Copyright © 2025 cys. All rights reserved.
//

import UIKit

class YCBaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var clsName:String = ""
    var sourceArr:[[String:Any]] = []
    
    lazy var introduceView:YCIntroduceView = {
        let introduceView = YCIntroduceView(frame: self.view.bounds)
        return introduceView
    }()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(YCPublicTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(YCPublicTableViewCell.self))
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        view.addSubview(introduceView)
        
        introduceView.setIntroduceText(text: pageProblemDesc())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(YCPublicTableViewCell.self), for: indexPath) as! YCPublicTableViewCell
        cell.cellTitleLab.text = sourceArr[indexPath.row]["title"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 获取选中行对应的数据
        let rowData = sourceArr[indexPath.row]
        let clsName:String = rowData["target"] as! String
        if let clssType = clsName.classFromString() as? YCBaseViewController.Type {
            let targetVC: YCBaseViewController = clssType.init()
            if let title = rowData["title"] as? String {
                targetVC.title = title
            }
            navigationController?.pushViewController(targetVC, animated: true)
        }
    }
    
    func getClsName() -> String {
        return "\(String(describing: title))(\(String(describing: type(of: self))))"
    }
    
    func pageProblemDesc() -> String {
        return ""
    }
}
