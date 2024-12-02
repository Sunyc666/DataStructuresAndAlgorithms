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
    
    //[1,6],[8,10],[15,18]
    NSArray *sourceArr1 = @[
        [RangeItem newWithStart:1 end:3],
        [RangeItem newWithStart:15 end:18],
        [RangeItem newWithStart:2 end:6],
        [RangeItem newWithStart:8 end:10]
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
