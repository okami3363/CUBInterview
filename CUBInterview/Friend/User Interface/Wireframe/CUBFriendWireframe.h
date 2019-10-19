//
//  CUBFriendWireframe.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class CUBRootWireframe;
@class CUBFriendPresenter;

NS_ASSUME_NONNULL_BEGIN

@interface CUBFriendWireframe : NSObject

@property (nonatomic, strong) CUBRootWireframe *rootWireframe;
@property (nonatomic, strong, nullable) CUBFriendPresenter *presenter;

- (void)comeBackViewController;

- (void)deallocViperModule;

- (void)createViperModule;

- (void)presentInterfaceFromWindow:(UIWindow *)window;

@end

NS_ASSUME_NONNULL_END
