//
//  CUBFriendPresenter.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CUBFriendWireframe;
@class CUBFriendInteractor;

typedef NS_ENUM(NSInteger,CUBTestType){
    CUBTestType1 = 1,   //(1) 無好友畫面
    CUBTestType2,       //(2) 只有好友列表
    CUBTestType3,       //(3) 好友列表含邀請
};

NS_ASSUME_NONNULL_BEGIN

@interface CUBFriendPresenter : NSObject

@property (nonatomic, strong, nullable) CUBFriendWireframe *wireframe;
@property (nonatomic, strong, nullable) CUBFriendInteractor *interactor;

@property CUBTestType testType;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *results;

- (void)get_status_no_friend:(void(^)(NSArray*))entitiesData;
- (void)get_status_friend:(void(^)(NSArray*))entitiesData;
- (void)get_status_friend_and_invite:(void(^)(NSArray*))entitiesData;

@end

NS_ASSUME_NONNULL_END
