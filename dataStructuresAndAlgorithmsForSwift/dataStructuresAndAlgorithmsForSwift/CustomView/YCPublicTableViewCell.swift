//
//  YCPublicTableViewCell.swift
//  dataStructuresAndAlgorithmsForSwift
//
//  Created by Sunyc on 2025/2/18.
//  Copyright © 2025 cys. All rights reserved.
//

import UIKit

class YCPublicTableViewCell: UITableViewCell {

    let cellTitleLab:UILabel = {
        let cellTitleLab = UILabel(frame: CGRect(x: 15, y: 0, width: UIScreen.main.bounds.size.width - 30, height: 44))
        cellTitleLab.textColor = .black
        cellTitleLab.font = UIFont.systemFont(ofSize: 15)
        return cellTitleLab
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    func setupUI() {
        contentView.addSubview(cellTitleLab)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
