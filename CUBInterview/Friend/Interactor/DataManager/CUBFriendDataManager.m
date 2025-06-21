//
//  CUBFriendDataManager.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBFriendDataManager.h"
#import "CUBApiClientCenter.h"


@implementation CUBFriendDataManager

- (void)getUserDataSuccess:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure {
    NSString *urlString = @"https://okami3363.github.io/man.json";
    
    [[CUBApiClientCenter sharedInstance] httpGetRespondArrayDataHandel:urlString success:^(NSArray * _Nonnull dataArrry) {
        success(dataArrry);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)getNoFriendSuccess:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure {
    NSString *urlString = @"https://okami3363.github.io/friend4.json";
    
    [[CUBApiClientCenter sharedInstance] httpGetRespondArrayDataHandel:urlString success:^(NSArray * _Nonnull dataArrry) {
        success(dataArrry);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)getFriend1Success:(void (^)(NSArray * _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure {
    
    //跑測試用，模擬測試資料
    [self mockForTesting:failure success:success];
    if (self.mockCase != MockCase_None) return;
    
    NSString *urlString = @"https://okami3363.github.io/friend1.json";
    
    [[CUBApiClientCenter sharedInstance] httpGetRespondArrayDataHandel:urlString success:^(NSArray * _Nonnull dataArrry) {
        success(dataArrry);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
    
}

- (void)getFriend2Success:(void (^)(NSArray * _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure {
    
    NSString *urlString = @"https://okami3363.github.io/friend2.json";
    
    [[CUBApiClientCenter sharedInstance] httpGetRespondArrayDataHandel:urlString success:^(NSArray * _Nonnull dataArrry) {
        success(dataArrry);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
    
}

- (void)getInviteSuccess:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure {
    
    NSString *urlString = @"https://okami3363.github.io/friend3.json";
    
    [[CUBApiClientCenter sharedInstance] httpGetRespondArrayDataHandel:urlString success:^(NSArray * _Nonnull dataArrry) {
        success(dataArrry);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
    
}

#pragma mark - private

//跑測試用，模擬測試資料
- (void)mockForTesting:(void (^ _Nonnull)(NSError * _Nonnull))failure success:(void (^ _Nonnull)(NSArray * _Nonnull))success {
    
    switch (self.mockCase) {
        case MockCase_None:
            break;
            
        case MockCase_Success:{
            NSArray *array = @[@{@"name": @"黃靖僑",
                                 @"status": @0,
                                 @"isTop": @"0",
                                 @"fid": @"001",
                                 @"updateDate": @"20190801"},
                               @{@"name": @"翁勳儀",
                                 @"status": @2,
                                 @"isTop": @"1",
                                 @"fid": @"002",
                                 @"updateDate": @"20190802"}];
            success(array);
        }
            break;
            
        case MockCase_Fail:{
            NSError *error = [NSError errorWithDomain:@"TestError" code:999 userInfo:nil];
            failure(error);
        }
            break;
    }
}

@end
