//
//  String+YCAdd.swift
//  dataStructuresAndAlgorithmsForSwift
//
//  Created by Sunyc on 2025/2/18.
//  Copyright © 2025 cys. All rights reserved.
//

import Foundation

extension String {
    /// 字符串转类
    func classFromString() -> AnyClass? {
        // 1、获swift中的命名空间名
        var name = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String
        // 2、如果包名中有'-'横线这样的字符，在拿到包名后，还需要把包名的'-'转换成'_'下横线
        name = name?.replacingOccurrences(of: "-", with: "_")
        // 3、拼接命名空间和类名，”包名.类名“
        let fullClassName = name! + "." + self
        // 通过NSClassFromString获取到最终的类
        let anyClass: AnyClass? = NSClassFromString(fullClassName)
        // 本类type
        return anyClass
    }
}
