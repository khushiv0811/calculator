//
//  Calculate.h
//  CalculatorFramework
//
//  Created by Kushboo Patel on 3/8/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface Calculate : NSObject

+ (NSNumber *)add:(NSNumber *)a to:(NSNumber *)b;
+ (NSNumber *)subtract:(NSNumber *)a from:(NSNumber *)b;
+ (NSNumber *)multiply:(NSNumber *)a by:(NSNumber *)b;
+ (NSNumber *)divide:(NSNumber *)a by:(NSNumber *)b;

@end
NS_ASSUME_NONNULL_END
