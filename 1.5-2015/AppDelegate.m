//
//  AppDelegate.m
//  1.5-2015
//
//  Created by Mac on 16/1/5.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AppDelegate.h"
#import "JSTabBarController.h"
#import <SMS_SDK/SMSSDK.h>


//分享
#define APPKEY @"e6d28dda1de1"
#define APPSECTET @"01765569206c17ced5b0dd3f9786ec20"


//短信
#define APPkey @"e6f993dadc38"
#define APPsecret @"d5378ee94e044897bb0c0cda16268cd5"
@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [SMSSDK registerApp:APPkey
             withSecret:APPsecret];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    JSTabBarController *jstc = [[JSTabBarController alloc]init];
    
    self.window.rootViewController = jstc;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   UIBackgroundTaskIdentifier task = [application beginBackgroundTaskWithExpirationHandler:^{
        [application endBackgroundTask:task];
    }];
   
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}



-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application{

}
@end
