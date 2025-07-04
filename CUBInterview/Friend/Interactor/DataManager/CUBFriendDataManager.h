//
//  CUBFriendDataManager.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//跑測試用，模擬測試資料
typedef NS_ENUM(NSUInteger, MockCase) {
    MockCase_None,
    MockCase_Success,
    MockCase_Fail,
};

@interface CUBFriendDataManager : NSObject

//跑測試用，模擬測試資料
@property (nonatomic, assign) MockCase mockCase;

- (void)getUserDataSuccess:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure;

- (void)getNoFriendSuccess:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure;

- (void)getFriend1Success:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure;

- (void)getFriend2Success:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure;

- (void)getInviteSuccess:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
