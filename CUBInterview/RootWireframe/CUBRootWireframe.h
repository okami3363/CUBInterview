//
//  CUBRootWireframe.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class CUBFriendWireframe;

NS_ASSUME_NONNULL_BEGIN

@interface CUBRootWireframe : NSObject

- (void)installRootViewControllerIntoWindow:(UIWindow *)window;

- (void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window tabBarItem:(UITabBarItem*)tabBarItem show:(BOOL)show;

@end

NS_ASSUME_NONNULL_END
