//
//  LinkedListAscendingMergeVC.m
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/11/29.
//

#import "LinkedListAscendingMergeVC.h"
#import "LinkedListNode.h"

@interface LinkedListAscendingMergeVC ()

@end

@implementation LinkedListAscendingMergeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

     输入：l1 = [1,2,4], l2 = [1,3,4]
     输出：[1,1,2,3,4,4]
     示例 2：
     输入：l1 = [], l2 = []
     输出：[]
     示例 3：
     输入：l1 = [], l2 = [0]
     输出：[0]
     */
    
    LinkedListNode *node1 = [LinkedListNode newWithValues:@[@1,@2,@4]];
    LinkedListNode *node2 = [LinkedListNode newWithValues:@[@1,@3,@5]];
    
    [LinkedListNode logMethod:node1 target:self.clsName isBefore:YES];
    [LinkedListNode logMethod:node2 target:self.clsName isBefore:YES];
    
    LinkedListNode *merge = [self mergeMethod:node1 node2:node2];
    [LinkedListNode logMethod:merge target:self.clsName isBefore:NO];
}

-(LinkedListNode *)mergeMethod:(LinkedListNode *)node1 node2:(LinkedListNode *)node2{
    //升序链表合并，就是让两个链表组装成一个链表，需要新建一个链表的表头作为拼接起点
    LinkedListNode *place = [LinkedListNode newWithValue:-1];
    
    LinkedListNode *prev  = place;
    
    //情况1：两个表，均非空
    while (node1 && node2) {
        if (node1.value < node2.value) {
            prev.next = node1;
            //移动指针到node1的下一位
            node1 = node1.next;
        } else {
            prev.next = node2;
            //移动指针到node2的下一位
            node2 = node2.next;
        }
        //将拼接后的链表指针移动到下一位
        prev = prev.next;
    }
    
    //情况2：其中一个是空的
    prev.next = node1 ? node1 : node2;
    
    //由于第一个节点是占位符，所以，从第一个节点的下一个位置返回即可
    return place.next;
}

-(NSString *)pageProblemDesc{
    return @"将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。\n输入：l1 = [1,2,4], l2 = [1,3,4]\n输出：[1,1,2,3,4,4]\n示例 2：\n输入：l1 = [], l2 = []\n输出：[]\n示例 3：\n输入：l1 = [], l2 = [0]\n输出：[0]";
}

@end
