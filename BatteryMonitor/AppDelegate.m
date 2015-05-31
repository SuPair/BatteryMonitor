//
//  AppDelegate.m
//  BatteryMonitor
//
//  Created by Brian Gilham on 2015-05-30.
//  Copyright (c) 2015 Brian Gilham. All rights reserved.
//

#import "AppDelegate.h"

#import "BatteryMonitor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - App Cycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{  
    return YES;
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply
{
    __block UIBackgroundTaskIdentifier bogusWorkaroundTask;
    bogusWorkaroundTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:bogusWorkaroundTask];
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] endBackgroundTask:bogusWorkaroundTask];
    });
    // --------------------
    
    __block UIBackgroundTaskIdentifier realBackgroundTask;
    realBackgroundTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        reply(nil);
        [[UIApplication sharedApplication] endBackgroundTask:realBackgroundTask];
    }];
    
    BatteryMonitor *monitor = [[BatteryMonitor alloc] initWithLevelChangeBlock:nil stateChangeBlock:nil];
    
    NSDictionary *response = @{
                               @"BatteryLevel":monitor.batteryLevelString,
                               @"BatteryState":monitor.batteryStateString
                               };
    reply(response);
    [[UIApplication sharedApplication] endBackgroundTask:realBackgroundTask];
}

#pragma mark - Unused
- (void)applicationWillResignActive:(UIApplication *)application {}
- (void)applicationDidEnterBackground:(UIApplication *)application {}
- (void)applicationWillEnterForeground:(UIApplication *)application {}
- (void)applicationDidBecomeActive:(UIApplication *)application {}
- (void)applicationWillTerminate:(UIApplication *)application {}

@end
