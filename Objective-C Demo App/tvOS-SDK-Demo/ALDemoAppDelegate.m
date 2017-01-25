//
//  ALDemoAppDelegate.m
//  tvOS-SDK-Demo
//
//  Created by Thomas on 11/13/15.
//  Copyright © 2015 AppLovin. All rights reserved.
//

#import "ALDemoAppDelegate.h"
#import "ALSdk.h"
#import "Amplitude.h"

@implementation ALDemoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initializing our SDK at launch is very important as it'll start preloading ads in the background.
    [ALSdk initializeSdk];
    
    [[UINavigationBar appearance] setTranslucent: NO];
    [[UINavigationBar appearance] setBarTintColor: [UIColor colorWithRed: 10.0f/255.0f green: 131.0f/255.f blue: 170.0f/255.0f alpha: 1.0f]];
    [[UINavigationBar appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [[UINavigationBar appearance] setTintColor: [UIColor whiteColor]];

    [[Amplitude instance] initializeApiKey:@"5991e74feae44012f071fae1383099e8"];
    [[Amplitude instance] setTrackingSessionEvents:YES];
    [[Amplitude instance] setMinTimeBetweenSessionsMillis:5000];
    return YES;
}

@end
