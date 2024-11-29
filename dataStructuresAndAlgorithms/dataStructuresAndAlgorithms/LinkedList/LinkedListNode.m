//
//  LinkedListNode.m
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/11/29.
//

#import "LinkedListNode.h"

@implementation LinkedListNode

+(instancetype)newWithValue:(int)value{
    LinkedListNode *item = [[LinkedListNode alloc]init];
    item.value = value;
    item.next  = nil;
    return item;
}

+(void)logMethod:(LinkedListNode *)head target:(NSString *)target isBefore:(BOOL)isBefore{
    NSLog(@"%@-----------操作%@",target,isBefore ? @"前" : @"后");
    while (head) {
        NSLog(@"%d",head.value);
        head = head.next;
    }
}

+(LinkedListNode *)newWithValues:(nonnull NSArray <NSNumber *>*)values{
    LinkedListNode *head   = [LinkedListNode newWithValue:-1];
    LinkedListNode *before = head;
    
    for (NSNumber *item in values) {
        LinkedListNode *node = [LinkedListNode newWithValue:item.intValue];
        before.next = node;
        before = before.next;
    }
    
    return head.next;
}

@end
