//
//  CUBFriendPresenter.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CUBFriendModuleInterface.h"
@class CUBFriendWireframe;
@class CUBFriendInteractor;

NS_ASSUME_NONNULL_BEGIN

@interface CUBFriendPresenter : NSObject <CUBFriendModuleInterface>

@property (nonatomic, strong, nullable) CUBFriendWireframe *wireframe;
@property (nonatomic, strong, nullable) CUBFriendInteractor *interactor;

@end

NS_ASSUME_NONNULL_END
