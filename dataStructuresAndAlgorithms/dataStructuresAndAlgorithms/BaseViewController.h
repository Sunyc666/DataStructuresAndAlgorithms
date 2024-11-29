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
@property (nonatomic, copy)   NSString *questionDesc;
@property (nonatomic, strong) NSArray <NSDictionary *>*sourceArr;
@end

NS_ASSUME_NONNULL_END
