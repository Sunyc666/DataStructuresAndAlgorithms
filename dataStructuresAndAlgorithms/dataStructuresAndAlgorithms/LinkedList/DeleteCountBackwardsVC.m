//
//  DeleteCountBackwardsVC.m
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/12/4.
//

#import "DeleteCountBackwardsVC.h"
#import "LinkedListNode.h"

@interface DeleteCountBackwardsVC ()

@end

@implementation DeleteCountBackwardsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     给你一个链表，删除链表的倒数第 n **个结点，并且返回链表的头结点。
     示例 1：
     输入：head = [1,2,3,4,5], n = 2
     输出：[1,2,3,5]
     示例 2：
     输入：head = [1], n = 1
     输出：[]
     示例 3：
     输入：head = [1,2], n = 1
     输出：[1]
     */
    
    LinkedListNode *node = [LinkedListNode newWithValues:@[@1,@2,@3,@4,@5]];
    [LinkedListNode logMethod:node target:self.clsName isBefore:YES];
    LinkedListNode *result = [self toDeleteTheCountBackwards:2 head:node];
    [LinkedListNode logMethod:result target:self.clsName isBefore:NO];
}

-(LinkedListNode *)toDeleteTheCountBackwards:(NSInteger)countBack head:(LinkedListNode *)head{
    LinkedListNode *result = [LinkedListNode newWithValue:-1];
    result.next = head;
    LinkedListNode *slow = result;
    LinkedListNode *fast = result;
    
    for (int i = 0; i < countBack; i++) {
        fast = fast.next;
    }
    
    while (fast.next) {
        fast = fast.next;
        slow = slow.next;
    }
    
    LinkedListNode *toDelete = slow.next;
    slow.next = toDelete.next;
    
    return result.next;
}

-(NSString *)pageProblemDesc{
    return @"给你一个链表，删除链表的倒数第 n **个结点，并且返回链表的头结点。\n示例1：\n输入：head = [1,2,3,4,5], n = 2\n输出：[1,2,3,5]\n示例2：\n输入：head = [1], n = 1\n输出：[]\n示例 3：\n输入：head = [1,2], n = 1\n输出：[1]";
}

@end
