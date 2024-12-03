//
//  SumOfTwoNumVC.m
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/12/2.
//

#import "SumOfTwoNumVC.h"

@interface SumOfTwoNumVC ()

@end

@implementation SumOfTwoNumVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    /*
     给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target 的那 两个 整数，并返回它们的数组下标。
     你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。
     示例 1：
     输入：nums = [2,7,11,15], target = 9
     输出：[0,1]
     解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
     */
    
    NSArray *sourceArr = @[@2,@11,@7,@15];
    NSInteger target   = 10;
    
    NSLog(@"结果：%@",[self sum:sourceArr target:target]);
}

-(NSArray *)sum:(NSArray <NSNumber *>*)source target:(NSInteger)target{
    NSMutableDictionary *map = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < source.count; i++) {
        //2~7;7~2;
        NSInteger diff = target - source[i].integerValue;
        if ([map.allKeys containsObject:[NSString stringWithFormat:@"%@",@(diff)]]) {
            return @[map[[NSString stringWithFormat:@"%@",@(diff)]],@(i)];
        }
        [map setObject:[NSString stringWithFormat:@"%@",@(i)] forKey:[NSString stringWithFormat:@"%@",source[i]]];
    }
    
    return @[];
}

-(NSString *)pageProblemDesc{
    return @"给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target 的那 两个 整数，并返回它们的数组下标。\n你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。\n示例 1：\n输入：nums = [2,7,11,15], target = 9\n输出：[0,1]\n解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。";
}

@end
