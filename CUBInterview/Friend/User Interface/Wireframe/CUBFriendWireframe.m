//
//  CUBFriendWireframe.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBFriendWireframe.h"
#import "CUBFriendViewController.h"
#import "CUBRootWireframe.h"
#import "CUBFriendPresenter.h"
#import "CUBFriendInteractor.h"

@implementation CUBFriendWireframe

- (void)comeBackViewController {
    
    [self deallocViperModule];
    
}

- (void)deallocViperModule {
    
    self.presenter.wireframe = nil;
    self.presenter.interactor = nil;
    self.presenter = nil;
    
}

- (void)createViperModule {
    
    CUBFriendPresenter *presenter = [[CUBFriendPresenter alloc] init];
    CUBFriendInteractor *interactor = [[CUBFriendInteractor alloc] init];
    
    self.presenter = presenter;
    presenter.interactor = interactor;
    presenter.wireframe = self;
    
}

- (void)presentInterfaceFromWindow:(UIWindow *)window {
    CUBFriendViewController *viewController = [[CUBFriendViewController alloc] init];
        viewController.eventHandler = (id)self.presenter;
        UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"tab"] tag:0];
        [self.rootWireframe showRootViewController:viewController inWindow:window tabBarItem:tabBarItem show:YES];
}

@end
