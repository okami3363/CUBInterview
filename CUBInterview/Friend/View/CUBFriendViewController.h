//
//  CUBFriendViewController.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CUBFriendPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface CUBFriendViewController : UIViewController

@property (nonatomic, strong) CUBFriendPresenter *eventHandler;

@end

NS_ASSUME_NONNULL_END
