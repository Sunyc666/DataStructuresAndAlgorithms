//
//  RangeItem.m
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/12/2.
//

#import "RangeItem.h"

@implementation RangeItem
+(instancetype)newWithStart:(NSInteger)start end:(NSInteger)end{
    if (start < 0 || end < 0 || end < start) {
        return nil;
    }
    
    RangeItem *item = [[RangeItem alloc]init];
    item.start = start;
    item.end = end;
    return item;
}

-(void)logMethod{
    NSLog(@"RangeItem:%@",[NSString stringWithFormat:@"[%@,%@]",@(self.start),@(self.end)]);
}

@end
