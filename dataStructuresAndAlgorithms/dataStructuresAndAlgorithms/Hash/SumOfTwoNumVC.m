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

@end
