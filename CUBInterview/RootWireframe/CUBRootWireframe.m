//
//  CUBRootWireframe.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBRootWireframe.h"
#import "CUBFriendWireframe.h"

@interface CUBRootWireframe()
@property (nonatomic, strong) CUBFriendWireframe *friendWireframe;
@end

@implementation CUBRootWireframe

- (void)installRootViewControllerIntoWindow:(UIWindow *)window {
    
    self.friendWireframe = [[CUBFriendWireframe alloc] init];
    self.friendWireframe.rootWireframe = self;

    [self.friendWireframe createViperModule];
    [self.friendWireframe presentInterfaceFromWindow:window];
    
}

- (void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window tabBarItem:(UITabBarItem *)tabBarItem show:(BOOL)show {
    
    UITabBarController *tabBarController = nil;
    if([((UITabBarController *)window.rootViewController) isKindOfClass:[UITabBarController class]]){
        tabBarController = (UITabBarController *)window.rootViewController;
    }

    NSMutableArray *tabBarItems;
    if (!tabBarController) {
        tabBarController = [[UITabBarController alloc] init];
        UIColor *color = [UIColor colorWithRed:236/255.0f green:0/255.0f blue:140/255.0f alpha:1.0f];
        tabBarController.tabBar.tintColor = color;
        tabBarItems = [[NSMutableArray alloc] init];
        window.rootViewController = tabBarController;
    }
    else {
        tabBarItems = [tabBarController.viewControllers mutableCopy];
    }
    
    viewController.tabBarItem = tabBarItem;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigationController.viewControllers = @[viewController];
    navigationController.navigationBarHidden = YES;
    
    [tabBarItems addObject:navigationController];
   
    tabBarController.viewControllers = tabBarItems;
    
    if(show) {
        [[navigationController.viewControllers objectAtIndex:0] view];
    }
    

}

@end
