//
//  CUBAppDependencies.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class CUBRootWireframe;

NS_ASSUME_NONNULL_BEGIN

@interface CUBAppDependencies : NSObject

@property (strong, nonatomic,readonly) CUBRootWireframe *rootWireframe;

+ (instancetype)sharedInstance;
- (void)installRootViewControllerIntoWindow:(UIWindow *)window;

@end

NS_ASSUME_NONNULL_END
