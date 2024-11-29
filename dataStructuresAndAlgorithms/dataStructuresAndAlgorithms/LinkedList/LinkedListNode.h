//
//  LinkedListNode.h
//  dataStructuresAndAlgorithms
//
//  Created by a on 2024/11/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LinkedListNode : NSObject
@property(nonatomic, assign) int value;
@property(nonatomic, strong, nullable)LinkedListNode *next;

+(instancetype)newWithValue:(int)value;

+(LinkedListNode *)newWithValues:(nonnull NSArray <NSNumber *>*)values;

/// 传入一个链表的表头
/// - Parameters:
///   - head: 表头
///   - target: 输出源头
///   - isBefore: 操作前或操作后
+(void)logMethod:(LinkedListNode *)head target:(NSString *)target isBefore:(BOOL)isBefore;

@end

NS_ASSUME_NONNULL_END
