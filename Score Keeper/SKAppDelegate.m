//
//  SKAppDelegate.m
//  Score Keeper
//
//  Created by Joshua Howland on 5/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "SKAppDelegate.h"

@implementation SKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    UINavigationController *navigationController = [[UINavigationController alloc] init];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
    
}

@end
