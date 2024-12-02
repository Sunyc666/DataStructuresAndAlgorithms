//
//  RangeItem.h
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/12/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RangeItem : NSObject
@property(nonatomic, assign)NSInteger start;
@property(nonatomic, assign)NSInteger end;
+(instancetype)newWithStart:(NSInteger)start end:(NSInteger)end;
-(void)logMethod;
@end

NS_ASSUME_NONNULL_END
