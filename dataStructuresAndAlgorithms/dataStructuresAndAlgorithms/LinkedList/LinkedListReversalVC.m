//
//  LinkedListReversalVC.m
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/11/29.
//

#import "LinkedListReversalVC.h"
#import "LinkedListNode.h"

@interface LinkedListReversalVC ()

@end

@implementation LinkedListReversalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
     示例：
     输入：head = [1,2,3,4,5]
     输出：[5,4,3,2,1]
     */
    LinkedListNode *node = [LinkedListNode newWithValues:@[@1,@2,@3]];
    [LinkedListNode logMethod:node target:self.clsName isBefore:YES];
    [LinkedListNode logMethod:[self sortMethod:node] target:self.clsName isBefore:NO];
}

-(LinkedListNode *)sortMethod:(LinkedListNode *)head{
    //反转链表，就是让next指向反方向
    LinkedListNode *prev    = nil;
    //记录当前位置
    LinkedListNode *current = head;
    while (current) {
        //获取当前位置的下一个节点
        LinkedListNode *next = current.next;
        //反转
        current.next = prev;
        //把当前节点作为上一个节点，用来下次指向
        prev = current;
        //记录下一次循环的起点
        current = next;
    }
    
    // 由于每次prev都会把最新的current存下来，所以在完成最后的遍历时，prev就是新的表头了。
    return prev;
}

-(NSString *)pageProblemDesc{
    return @"给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。\n示例：\n输入：head = [1,2,3,4,5]\n输出：[5,4,3,2,1]";
}

@end
