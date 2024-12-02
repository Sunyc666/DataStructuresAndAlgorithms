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
@property (nonatomic, strong) UILabel *desLab;
@property (nonatomic, strong) UIView  *desView;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:self.desLab];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(HomeTableViewCell.class) bundle:nil]
         forCellReuseIdentifier:NSStringFromClass(HomeTableViewCell.class)];
}

-(UIView *)desView{
    if (!_desView) {
        _desView = [[UIView alloc]initWithFrame:CGRectMake(10, 80, self.view.frame.size.width - 20, self.view.frame.size.height - 160)];
    }
    return _desView;
}

-(UILabel *)desLab{
    if (!_desLab) {
        _desLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, self.view.frame.size.width - 20, self.view.frame.size.height - 160)];
        _desLab.numberOfLines = 0;
        _desLab.font = [UIFont systemFontOfSize:15];
        _desLab.layer.cornerRadius = 5;
        _desLab.backgroundColor = UIColor.systemGrayColor;
        _desLab.hidden = self.desc.length <= 0;
        _desLab.text   = self.desc;
    }
    return _desLab;
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
        targetVC.desc  = self.sourceArr[indexPath.row][@"desc"];
        [self.navigationController pushViewController:targetVC animated:YES];
    }
}

-(NSString *)clsName{
    return [NSString stringWithFormat:@"%@(%@)",self.title,NSStringFromClass(self.class)];
}

@end
