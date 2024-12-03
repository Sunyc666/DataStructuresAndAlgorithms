//
//  MergeOfArrayVC.m
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/12/2.
//

#import "MergeOfArrayVC.h"
#import "RangeItem.h"

@interface MergeOfArrayVC ()

@end

@implementation MergeOfArrayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回 一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间 。
     示例 1：
     输入：intervals = [[1,3],[2,6],[8,10],[15,18]]
     输出：[[1,6],[8,10],[15,18]]
     解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
     示例 2：
     输入：intervals = [[1,4],[4,5]]
     输出：[[1,5]]
     解释：区间 [1,4] 和 [4,5] 可被视为重叠区间。
     */
    
    //[1,6],[8,10],[15,18]
    NSArray *sourceArr1 = @[
        [RangeItem newWithStart:1 end:3],
        [RangeItem newWithStart:2 end:6],
        [RangeItem newWithStart:8 end:10],
        [RangeItem newWithStart:15 end:18]
    ];
    
    //[1,5]
    NSArray *sourceArr2 = @[
        [RangeItem newWithStart:1 end:4],
        [RangeItem newWithStart:4 end:5]
    ];
    
    NSArray *sourceArr3 = @[
        [RangeItem newWithStart:1 end:7],
        [RangeItem newWithStart:1 end:3],
        [RangeItem newWithStart:9 end:11]
    ];
    
    NSArray *result = [self mergeMethod:sourceArr1];
    for (RangeItem *item in result) {
        [item logMethod];
    }
    NSLog(@"---------------------");
    NSArray *result2 = [self mergeMethod:sourceArr2];
    for (RangeItem *item in result2) {
        [item logMethod];
    }
}

-(NSArray *)mergeMethod:(NSArray <RangeItem *>*)source{
    if (source.count <= 0) {
        return source;
    }
    
    //对数组内各个子数组进行进行排序
    NSArray *sortedIntervals = [source sortedArrayUsingComparator:^NSComparisonResult(RangeItem * _Nonnull obj1, RangeItem * _Nonnull obj2) {
        NSInteger start1 = obj1.start;
        NSInteger start2 = obj2.start;
        return start1 > start2;
    }];
    
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for (int i = 0; i < sortedIntervals.count; i++) {
        RangeItem *current = sortedIntervals[i];
        if (i == 0) {
            [result addObject:current];
            continue;
        }
        
        RangeItem *before = result.lastObject;
        if ((current.start <= before.end) && (current.start >= before.start)) {
            before.start = before.start;
            before.end   = MAX(current.end, before.end);
        } else {
            [result addObject:current];
        }
    }
    
    return result;
}

-(NSString *)pageProblemDesc{
    return @"以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回 一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间 。\n示例 1：\n输入：intervals = [[1,3],[2,6],[8,10],[15,18]]\n输出：[[1,6],[8,10],[15,18]]\n解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].\n示例 2：\n输入：intervals = [[1,4],[4,5]]\n输出：[[1,5]]\n解释：区间 [1,4] 和 [4,5] 可被视为重叠区间。";
}

@end
