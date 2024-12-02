//
//  ViewController.m
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/11/29.
//

#import "ViewController.h"
#import "HomeTableViewCell.h"
#import "BaseViewController.h"
#import <objc/runtime.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray <NSDictionary *>*sourceArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _sourceArr = @[
        @{
            @"title":@"链表",
            @"target":@"BaseViewController",
            @"desc":@"",
            @"subArr":@[
                @{
                    @"title":@"反转链表",
                    @"desc":@"",
                    @"target":@"LinkedListReversalVC"
                },
                @{
                    @"title":@"有序链表合并（升序）",
                    @"desc":@"",
                    @"target":@"LinkedListAscendingMergeVC"
                },
                @{
                    @"title":@"相交链表",
                    @"desc":@"",
                    @"target":@"LinkedListIntersectVC"
                }
            ]
        },
        @{
            @"title":@"集合与数组",
            @"desc":@"",
            @"target":@"BaseViewController",
            @"subArr":@[
                @{
                    @"title":@"数组内区间合并",
                    @"desc":@"",
                    @"target":@"MergeOfArrayVC"
                }
            ]
        },
        @{
            @"title":@"哈希",
            @"desc":@"",
            @"target":@"BaseViewController",
            @"subArr":@[
                @{
                    @"title":@"两数之和",
                    @"desc":@"输入：nums = [2,7,11,15], target = 9\n输出：[0,1]\n解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。",
                    @"target":@"SumOfTwoNumVC"
                }
            ]
        }
    ];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(HomeTableViewCell.class) bundle:nil]
         forCellReuseIdentifier:NSStringFromClass(HomeTableViewCell.class)];
    
    [self.tableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(HomeTableViewCell.class)];
    cell.cellTitle.text = self.sourceArr[indexPath.row][@"title"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourceArr.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *clsName = self.sourceArr[indexPath.row][@"target"];
    NSArray  *subArr  = self.sourceArr[indexPath.row][@"subArr"];
    Class targetClass = objc_getClass([clsName UTF8String]);
    if (targetClass && subArr.count > 0) {
        BaseViewController *targetVC = [[targetClass alloc]init];
        targetVC.sourceArr = subArr;
        targetVC.title = self.sourceArr[indexPath.row][@"title"];
        [self.navigationController pushViewController:targetVC animated:YES];
    }
    
}


@end
