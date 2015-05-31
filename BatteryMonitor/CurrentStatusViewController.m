//
//  CurrentStatusViewController.m
//  BatteryMonitor
//
//  Created by Brian Gilham on 2015-05-31.
//  Copyright (c) 2015 Brian Gilham. All rights reserved.
//

#import "CurrentStatusViewController.h"

#import "BatteryMonitor.h"

@interface CurrentStatusViewController ()

@property (weak, nonatomic) IBOutlet UILabel *batteryLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *batteryStateLabel;

@property (strong, nonatomic) BatteryMonitor *monitor;

@end

@implementation CurrentStatusViewController

#pragma mark - View Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.monitor = [[BatteryMonitor alloc] initWithLevelChangeBlock:^(float batteryLevel) {
        [self updateLevelLabelWithLevel:batteryLevel];
    } stateChangeBlock:^(UIDeviceBatteryState batteryState) {
        [self updateStateLabelWithState:batteryState];
    }];
    
    [self updateLevelLabelWithLevel:self.monitor.batteryLevel];
    [self updateStateLabelWithState:self.monitor.batteryState];
}

- (void)updateLevelLabelWithLevel:(float)level
{
    self.batteryLevelLabel.text = [self.monitor batteryLevelString];
}

- (void)updateStateLabelWithState:(UIDeviceBatteryState)state
{
    self.batteryStateLabel.text = [self.monitor batteryStateString];
}

@end
