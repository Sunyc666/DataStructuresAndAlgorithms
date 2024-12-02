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
    // Do any additional setup after loading the view.
    
    LinkedListNode *intersect = [LinkedListNode newWithValue:4];
    LinkedListNode *end = [LinkedListNode newWithValue:5];
    
    LinkedListNode *n1a = [LinkedListNode newWithValue:1];
    LinkedListNode *n1b = [LinkedListNode newWithValue:2];
    
    n1a.next = n1b;
    n1b.next = intersect;
    intersect.next = end;
    
    LinkedListNode *n2a = [LinkedListNode newWithValue:1];
    LinkedListNode *n2c = [LinkedListNode newWithValue:3];
    n2a.next = n2c;
//    n2b.next = n2c;
    n2c.next = intersect;
    
    [LinkedListNode logMethod:n1a target:self.clsName isBefore:YES];
    [LinkedListNode logMethod:n2a target:self.clsName isBefore:YES];
    
    LinkedListNode *intersectItem = [self intersectMethod:n1a n2:n2a];
    [LinkedListNode logMethod:intersectItem target:self.clsName isBefore:NO];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
