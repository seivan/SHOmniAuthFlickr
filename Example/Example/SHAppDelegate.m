//
//  SHAppDelegate.m
//  SHOmniAuthFlickrExample
//
//  Created by Seivan Heidari on 5/13/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//

#import "SHAppDelegate.h"
#import "SHOmniAuth.h"
#import "SHOmniAuthFlickr.h"
#import "AFOAuth1Client.h"
#import "LUKeychainAccess.h"

@implementation SHAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions; {
//  LUKeychainAccess * keychain = [LUKeychainAccess standardKeychainAccess];
//  [keychain setObject:@{} forKey:@"kAccountStoreDicitonaryKey"];

  [SHOmniAuth registerProvidersWith:^(SHOmniAuthProviderBlock provider) {
    provider(SHOmniAuthFlickr.provider, @"f104eee60b4bd006f8acc152239df057", @"2dc8ceef3af6cec2", nil, @"flickr://success");
  }];
  return YES;
}

-(BOOL)application:(UIApplication *)application
           openURL:(NSURL *)url
 sourceApplication:(NSString *)sourceApplication
        annotation:(id)annotation; {
  
  
  NSNotification *notification = [NSNotification notificationWithName:kAFApplicationLaunchedWithURLNotification object:nil userInfo:[NSDictionary dictionaryWithObject:url forKey:kAFApplicationLaunchOptionsURLKey]];
  [[NSNotificationCenter defaultCenter] postNotification:notification];
  
  
  return YES;
}
							
-(void)applicationWillResignActive:(UIApplication *)application; {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

-(void)applicationDidEnterBackground:(UIApplication *)application; {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

-(void)applicationWillEnterForeground:(UIApplication *)application; {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

-(void)applicationDidBecomeActive:(UIApplication *)application; {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

-(void)applicationWillTerminate:(UIApplication *)application; {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
