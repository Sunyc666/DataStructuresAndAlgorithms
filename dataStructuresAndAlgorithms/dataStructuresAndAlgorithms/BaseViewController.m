//
//  BaseViewController.m
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/11/29.
//

#import "BaseViewController.h"
#import "HomeTableViewCell.h"
#import <objc/runtime.h>

@interface BaseViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(HomeTableViewCell.class) bundle:nil]
         forCellReuseIdentifier:NSStringFromClass(HomeTableViewCell.class)];
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
    Class targetClass = objc_getClass([clsName UTF8String]);
    if (targetClass) {
        BaseViewController *targetVC = [[targetClass alloc]init];
        targetVC.title = self.sourceArr[indexPath.row][@"title"];
        targetVC.questionDesc = self.sourceArr[indexPath.row][@"questionDesc"];
        [self.navigationController pushViewController:targetVC animated:YES];
    }
}

-(NSString *)clsName{
    return [NSString stringWithFormat:@"%@(%@)",self.title,NSStringFromClass(self.class)];
}

@end
