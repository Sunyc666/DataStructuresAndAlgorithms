//
//  LinkedListIntersectVC.m
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/12/2.
//

#import "LinkedListIntersectVC.h"
#import "LinkedListNode.h"

@interface LinkedListIntersectVC ()

@end

@implementation LinkedListIntersectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 null 。
     示例：
     输入：intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
     输出：Intersected at '2'
     */
    
    LinkedListNode *intersect = [LinkedListNode newWithValue:2];
    LinkedListNode *end = [LinkedListNode newWithValue:4];
    
    LinkedListNode *n1a = [LinkedListNode newWithValue:1];
    LinkedListNode *n1b = [LinkedListNode newWithValue:9];
    LinkedListNode *n1c = [LinkedListNode newWithValue:1];
    
    n1a.next = n1b;
    n1b.next = n1c;
    n1c.next = intersect;
    intersect.next = end;
    
    LinkedListNode *n2a = [LinkedListNode newWithValue:3];
    n2a.next = intersect;
    
    [LinkedListNode logMethod:n1a target:self.clsName isBefore:YES];
    [LinkedListNode logMethod:n2a target:self.clsName isBefore:YES];
    
    LinkedListNode *intersectItem = [self intersectMethod:n1a n2:n2a];
//    [LinkedListNode logMethod:intersectItem target:self.clsName isBefore:NO];
    NSLog(@"Intersected at:%d",intersectItem.value);
}

-(LinkedListNode *)intersectMethod:(LinkedListNode *)n1 n2:(LinkedListNode *)n2{
    LinkedListNode *p1 = n1;
    LinkedListNode *p2 = n2;
    
    while (p1 != p2) {
        p1 = p1 ? p1.next : n2;
        p2 = p2 ? p2.next : n1;
    }
    return p1;
}

-(NSString *)pageProblemDesc{
    return @"给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 null 。\n示例：\n输入：intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1\n输出：Intersected at '2'";
}

@end
