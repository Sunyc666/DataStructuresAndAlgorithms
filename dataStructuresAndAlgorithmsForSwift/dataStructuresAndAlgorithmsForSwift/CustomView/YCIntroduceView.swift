//
//  YCIntroduceView.swift
//  dataStructuresAndAlgorithmsForSwift
//
//  Created by Sunyc on 2025/2/18.
//  Copyright © 2025 cys. All rights reserved.
//

import UIKit

class YCIntroduceView: UIView {

    lazy var introduceTextView: UITextView = {
        let introduceTextView = UITextView(frame: CGRect(x: 10, y: 100, width: self.frame.size.width - 20, height: self.frame.size.height - 100))
        introduceTextView.textColor = .black
        introduceTextView.font = UIFont.systemFont(ofSize: 18)
        introduceTextView.isUserInteractionEnabled = false
        introduceTextView.backgroundColor = .white
        return introduceTextView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(introduceTextView)
    }
    
    func setIntroduceText(text:String) {
        introduceTextView.text = text
        self.isHidden = text.isEmpty
    }
}
