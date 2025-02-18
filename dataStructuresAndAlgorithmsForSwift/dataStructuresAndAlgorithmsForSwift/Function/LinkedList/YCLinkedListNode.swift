//
//  YCLinkedListNode.swift
//  dataStructuresAndAlgorithmsForSwift
//
//  Created by Sunyc on 2025/2/18.
//  Copyright © 2025 cys. All rights reserved.
//

import UIKit

class YCLinkedListNode: NSObject {
    var value:Int?
    var next:YCLinkedListNode?
    
    func newWith(value:Int) -> YCLinkedListNode {
        let node = YCLinkedListNode()
        node.value = value
        node.next = nil
        return node
    }
    
    func newWith(values:[Int]) -> YCLinkedListNode {
        var head:YCLinkedListNode?
        var current:YCLinkedListNode?
        for value in values {
            if head == nil {
                head = newWith(value: value)
                current = head
            } else {
                current?.next = newWith(value: value)
                current = current?.next
            }
        }
        return head!
    }
    
    func logMethod(node:YCLinkedListNode?, target:String, isBefore:Bool) {
        print("-----------------操作\(isBefore ? "前" : "后"),\(target)")
        var head = node
        while head != nil {
            print("\(String(describing: head?.value!))")
            head = head?.next
        }
    }
}
