//
//  GlanceController.m
//  BatteryMonitor WatchKit Extension
//
//  Created by Brian Gilham on 2015-05-31.
//  Copyright (c) 2015 Brian Gilham. All rights reserved.
//

#import "GlanceController.h"

@interface GlanceController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *batteryLevelLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *batteryStateLabel;

@end

@implementation GlanceController

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



