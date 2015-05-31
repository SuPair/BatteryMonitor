//
//  BatteryMonitor.h
//  BatteryMonitor
//
//  Created by Brian Gilham on 2015-05-30.
//  Copyright (c) 2015 Brian Gilham. All rights reserved.
//

@import UIKit;

typedef void (^BatteryLevelDidChangeBlock)(float batteryLevel);
typedef void (^BatteryStateDidChangeBlock)(UIDeviceBatteryState batteryState);

@interface BatteryMonitor : NSObject

@property (assign, nonatomic) float batteryLevel;
@property (assign, nonatomic) UIDeviceBatteryState batteryState;
@property (copy, nonatomic) BatteryLevelDidChangeBlock batteryLevelDidChangeBlock;
@property (copy, nonatomic) BatteryStateDidChangeBlock batteryStateDidChangeBlock;

- (instancetype)initWithLevelChangeBlock:(BatteryLevelDidChangeBlock)levelChangeBlock
                       stateChangeBlock:(BatteryStateDidChangeBlock)stateChangeBlock;
- (NSString *)batteryLevelString;
- (NSString *)batteryStateString;

@end
