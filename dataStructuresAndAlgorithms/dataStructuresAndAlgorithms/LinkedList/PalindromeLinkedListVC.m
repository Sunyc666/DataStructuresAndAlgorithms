//
//  PalindromeLinkedListVC.m
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/12/5.
//

#import "PalindromeLinkedListVC.h"
#import "LinkedListNode.h"

@interface PalindromeLinkedListVC ()

@end

@implementation PalindromeLinkedListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     给你一个单链表的头节点 head ，请你判断该链表是否为回文链表。如果是，返回 true ；否则，返回 false 。

     示例 1：
     输入：head = [1,2,2,1]
     输出：true

     示例 2：
     输入：head = [1,2]
     输出：false
     */
    
//    LinkedListNode *node = [LinkedListNode newWithValues:@[@1,@2,@2,@1]];
    LinkedListNode *node = [LinkedListNode newWithValues:@[@1,@2,@3,@1]];
    NSLog(@"回文：%@",[self isPalindrome:node] ? @"是" : @"否");
}

-(BOOL)isPalindrome:(LinkedListNode *)head{
    if (!head) {
        return YES;
    }
    
    LinkedListNode *middle = [self findMiddle:head];
    LinkedListNode *reback = [self reback:middle];
    
    LinkedListNode *p1 = head;
    LinkedListNode *p2 = reback;
    
    while (p2) {
        if (p1.value != p2.value) {
            return NO;
        }else{
            p1 = p1.next;
            p2 = p2.next;
        }
    }
    return YES;
}

-(LinkedListNode *)findMiddle:(LinkedListNode *)head{
    LinkedListNode *fast = head;
    LinkedListNode *slow = head;
    while (fast.next && fast) {
        fast = fast.next.next;
        slow = slow.next;
    }
    return slow;
}

-(LinkedListNode *)reback:(LinkedListNode *)head{
    LinkedListNode *before = nil;
    LinkedListNode *current = head;
    while (current) {
        LinkedListNode *next = current.next;
        current.next = before;
        before = current;
        current = next;
    }
    return before;
}

-(NSString *)pageProblemDesc{
    return @"给你一个单链表的头节点 head ，请你判断该链表是否为回文链表。如果是，返回 true ；否则，返回 false 。\n示例 1：\n输入：head = [1,2,2,1]\n输出：true\n示例 2：\n输入：head = [1,2]\n输出：false";
}

@end
