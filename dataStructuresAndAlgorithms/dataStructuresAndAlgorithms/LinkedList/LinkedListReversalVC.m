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
    // Do any additional setup after loading the view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
