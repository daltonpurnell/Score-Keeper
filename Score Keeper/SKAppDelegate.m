//
//  SKAppDelegate.m
//  Score Keeper
//
//  Created by Joshua Howland on 5/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "SKViewController.h"
#import "SKAppDelegate.h"

@implementation SKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    // initialize a UINavigationController with a SKViewController instance as the rootViewController
    
    SKViewController *viewController = [SKViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    // Make the navigationController the rootViewController of the window
    self.window.rootViewController = navigationController;
    
    
    [self.window makeKeyAndVisible];
    return YES;
    
}

@end
