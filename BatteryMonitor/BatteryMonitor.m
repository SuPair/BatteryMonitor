//
//  BatteryMonitor.m
//  BatteryMonitor
//
//  Created by Brian Gilham on 2015-05-30.
//  Copyright (c) 2015 Brian Gilham. All rights reserved.
//

#import "BatteryMonitor.h"

@implementation BatteryMonitor

- (instancetype)initWithLevelChangeBlock:(BatteryLevelDidChangeBlock)levelChangeBlock
                       stateChangeBlock:(BatteryStateDidChangeBlock)stateChangeBlock
{
    if((self = [super init])) {
        [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
        
        [self updateBatteryLevel];
        [self updateBatteryState];
        
        _batteryLevelDidChangeBlock = levelChangeBlock;
        _batteryStateDidChangeBlock = stateChangeBlock;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryLevelDidChange) name:UIDeviceBatteryLevelDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryStateDidChange) name:UIDeviceBatteryStateDidChangeNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)updateBatteryLevel
{
    self.batteryLevel = [[UIDevice currentDevice] batteryLevel];
}

- (void)updateBatteryState
{
    self.batteryState = [[UIDevice currentDevice] batteryState];
}

- (void)batteryLevelDidChange
{
    [self updateBatteryLevel];
    
    if(self.batteryLevelDidChangeBlock) {
        self.batteryLevelDidChangeBlock(self.batteryLevel);
    }
}

- (void)batteryStateDidChange
{
    [self updateBatteryState];
    
    if(self.batteryStateDidChangeBlock) {
        self.batteryStateDidChangeBlock(self.batteryState);
    }
}

- (NSString *)batteryLevelString
{
    return [NSString stringWithFormat:@"%.f%%", self.batteryLevel * 100];
}

- (NSString *)batteryStateString
{
    NSString *batteryStateString;
    switch(self.batteryState) {
        case UIDeviceBatteryStateCharging: {
            batteryStateString = @"Charging";
            break;
        }
            
        case UIDeviceBatteryStateFull: {
            batteryStateString = @"Full";
            break;
        }
            
        case UIDeviceBatteryStateUnknown: {
            batteryStateString = @"Unknown";
            break;
        }
            
        case UIDeviceBatteryStateUnplugged: {
            batteryStateString = @"Unplugged";
            break;
        }
    }
    
    return batteryStateString;
}

@end
