//
//  AppDelegate.m
//  BundleWriteTest
//
//  Created by Tomohiro Kumagai on H27/03/31.
//  Copyright (c) 平成27年 EasyStyle G.K. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Get path of Info.plist file in the Bundle.
    NSString* plist = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    
    // Read from Info.plist file.
    NSDictionary* info = [NSDictionary dictionaryWithContentsOfFile:plist];
    NSLog(@"%@", info);
    
    // Write to Info.plist file.
    NSMutableDictionary* rewrite = info.mutableCopy;
    
    rewrite[@"CFBundleDisplayName"] = @"Bundle Rewrite";
    
    BOOL succeeded = [rewrite writeToFile:plist atomically:YES];
    NSLog(succeeded ? @"OK" : @"NG");
    
    // Re-read from Info.plist file.
    NSDictionary* info2 = [NSDictionary dictionaryWithContentsOfFile:plist];
    NSLog(@"%@", info2);
    
    return YES;
}

@end
