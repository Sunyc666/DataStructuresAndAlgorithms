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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
