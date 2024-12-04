//
//  SumOfKArrVC.m
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/12/3.
//

#import "SumOfKArrVC.h"

@interface SumOfKArrVC ()

@end

@implementation SumOfKArrVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSArray *nums1 = @[@1, @1, @1];
//    NSInteger k1 = 2;
//    NSInteger result1 = [self subarraySum:nums1 k:k1];
//    NSLog(@"示例1结果: %ld", (long)result1);
    
    NSArray *nums2 = @[@1, @2, @3];
    NSInteger k2 = 3;
    NSInteger result2 = [self subarraySum:nums2 k:k2];
    NSLog(@"示例2结果: %ld", (long)result2);
}

-(NSInteger)subarraySum:(NSArray *)nums k:(NSInteger)k {
    NSInteger count = 0;
    NSInteger sum = 0;
    NSMutableDictionary *sumMap = [NSMutableDictionary dictionary];
    // 初始化前缀和为0出现1次
    [sumMap setObject:@1 forKey:@0];

    for (NSNumber *num in nums) {
        sum += num.integerValue;
        NSNumber *complement = @(sum - k);
        if ([sumMap objectForKey:complement]) {
            count += [sumMap[complement] integerValue];
        }
        // 更新当前前缀和的计数
        NSNumber *sumCount = sumMap[ @(sum) ];
        if (sumCount) {
            [sumMap setObject:@([sumCount integerValue] + 1) forKey:@(sum)];
        } else {
            [sumMap setObject:@1 forKey:@(sum)];
        }
    }

    return count;
}

@end
