//
//  AppDelegate.m
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import "AppDelegate.h"
#import "AboutScreenController.h"
#import "AlbumScreenController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    AlbumScreenController *albumScreen = [[AlbumScreenController alloc] init];
    albumScreen.title = @"Album Of Year";
    UINavigationController *naviAlbumScreen = [[UINavigationController alloc] initWithRootViewController:albumScreen];
    naviAlbumScreen.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Album"
                                                               image:[UIImage imageNamed:@"album.png"]
                                                        selectedImage:nil];
    
    AboutScreenController *aboutScreen = [[AboutScreenController alloc] init];
    aboutScreen.title = @"About";
    UINavigationController *naviAboutScreen = [[UINavigationController alloc] initWithRootViewController:aboutScreen];
    naviAboutScreen.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"About"
                                                               image:[UIImage imageNamed:@"about.png"]
                                                       selectedImage:nil];
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[naviAlbumScreen, naviAboutScreen];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}



@end
