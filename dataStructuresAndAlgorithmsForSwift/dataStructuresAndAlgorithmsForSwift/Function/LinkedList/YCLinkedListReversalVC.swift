//
//  YCLinkedListReversalVC.swift
//  dataStructuresAndAlgorithmsForSwift
//
//  Created by Sunyc on 2025/2/18.
//  Copyright © 2025 cys. All rights reserved.
//

import UIKit

class YCLinkedListReversalVC: YCBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let node = YCLinkedListNode().newWith(values: [1,2,3,4,5])
        node.logMethod(node: node, target: self.clsName, isBefore: true)
//        node.logMethod(node: reverseList(node) ?? YCLinkedListNode(), target: self.clsName, isBefore: false)
        node.logMethod(node: sortMethod(head: node) ?? YCLinkedListNode(), target: self.clsName, isBefore: false)
    }
    
    func sortMethod(head:YCLinkedListNode?) -> YCLinkedListNode? {
        // 初始化前一个节点为 nil
        var prev: YCLinkedListNode? = nil
        // 记录当前节点，初始化为头节点
        var current = head
        while current != nil {
            // 获取当前节点的下一个节点
            let next = current?.next
            // 反转当前节点的 next 指针
            current?.next = prev
            // 更新前一个节点为当前节点
            prev = current
            // 更新当前节点为下一个节点
            current = next
        }
        
        // 最终 prev 即为反转后链表的头节点
        return prev
    }
    
    func reverseList(_ head: YCLinkedListNode?) -> YCLinkedListNode?  {
        if head == nil || head?.next == nil {
            return  head
        }
        // 递归过来的节点
        let newHeader = reverseList(head!.next)
        // 重点是newHeader是最后一个节点，它是反转后的第一个节点
        // 我们要获取的是当前节点的下一个节点，就是newHeader的最后一个节点
        // 那么就通过head获取
        head?.next?.next = head
        head?.next = nil
        return newHeader
    }
    
    func reverseList2(_ head: YCLinkedListNode?) -> YCLinkedListNode?  {
        if head == nil || head?.next == nil {
            return  head
        }
        // 返回节点
        var preNode: YCLinkedListNode?
        // 待迭代的第一个节点
        var currentNode = head
        while currentNode != nil {
            // 保留迭代节点的next，防止丢失
            // 保留完next，就可以取出当前的cur放到pre里边
            let nextNode = currentNode?.next
            // 由于是反向，就是将节点取出来放在pre的前边
            currentNode?.next = preNode
            preNode = currentNode
            // cur置位next，进行下一轮
            currentNode = nextNode
        }
        return preNode
    }


    override func pageProblemDesc() -> String {
        return "给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。\n示例：\n输入：head = [1,2,3,4,5]\n输出：[5,4,3,2,1]"
    }

}
