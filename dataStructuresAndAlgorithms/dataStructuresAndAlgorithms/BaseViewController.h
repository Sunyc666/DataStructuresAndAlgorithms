//
//  BaseViewController.h
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/11/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
@property (nonatomic, copy)   NSString *clsName;
@property (nonatomic, strong) NSArray <NSDictionary *>*sourceArr;

-(void)updateDescView:(NSString *)descStr;
-(NSString *)pageProblemDesc;
@end

NS_ASSUME_NONNULL_END
