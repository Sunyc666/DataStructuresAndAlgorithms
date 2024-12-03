//
//  ProblemDescView.m
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/12/3.
//

#import "ProblemDescView.h"

@interface ProblemDescView ()
@property(nonatomic, strong)UITextView *descTextV;
@end

@implementation ProblemDescView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    self.hidden = YES;
    self.backgroundColor = UIColor.systemGrayColor;
    self.layer.cornerRadius = 10;
    [self addSubview:self.descTextV];
}

-(void)setDescStr:(NSString *)descStr{
    _descStr = descStr;
    self.hidden = _descStr.length <= 0;
    self.descTextV.text = _descStr;
}

-(UITextView *)descTextV{
    if (!_descTextV) {
        _descTextV = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 20)];
        _descTextV.font = [UIFont systemFontOfSize:15];
        _descTextV.userInteractionEnabled = NO;
        _descTextV.backgroundColor = UIColor.clearColor;
    }
    return _descTextV;
}

@end
