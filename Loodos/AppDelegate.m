//
//  AppDelegate.m
//  Loodos
//
//  Created by macbookair on 26.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FIRApp configure];
    return YES;
}

@end
