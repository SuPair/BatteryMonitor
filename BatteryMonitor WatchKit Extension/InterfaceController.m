//
//  InterfaceController.m
//  BatteryMonitor WatchKit Extension
//
//  Created by Brian Gilham on 2015-05-31.
//  Copyright (c) 2015 Brian Gilham. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *batteryLevelLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *batteryStateLabel;

@end

@implementation InterfaceController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];
}

- (void)willActivate
{
    [WKInterfaceController openParentApplication:@{} reply:^(NSDictionary *replyInfo, NSError *error) {
        [self.batteryLevelLabel setText:replyInfo[@"BatteryLevel"]];
        [self.batteryStateLabel setText:replyInfo[@"BatteryState"]];
    }];
    
    [super willActivate];
}

- (void)didDeactivate
{
    [super didDeactivate];
}

@end



