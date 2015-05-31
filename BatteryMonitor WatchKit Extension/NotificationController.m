//
//  NotificationController.m
//  BatteryMonitor WatchKit Extension
//
//  Created by Brian Gilham on 2015-05-31.
//  Copyright (c) 2015 Brian Gilham. All rights reserved.
//

#import "NotificationController.h"

@interface NotificationController()

@end

@implementation NotificationController

- (instancetype)init
{
    self = [super init];
    if (self){
        
    }
    return self;
}

- (void)willActivate
{
    [super willActivate];
}

- (void)didDeactivate
{
    [super didDeactivate];
}

/*
- (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a local notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}
*/

/*
- (void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a remote notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}
*/

@end



