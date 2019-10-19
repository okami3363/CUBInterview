//
//  CUBFriendPresenter.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBFriendPresenter.h"
#import "CUBFriendInteractor.h"

@implementation CUBFriendPresenter

- (void)get_status_no_friend:(void(^)(NSArray*))entitiesData {
    [self.interactor get_status_no_friend:entitiesData];
}

- (void)get_status_friend:(void(^)(NSArray*))entitiesData {
    [self.interactor get_status_friend:entitiesData];
}

- (void)get_status_friend_and_invite:(void(^)(NSArray*))entitiesData {
    [self.interactor get_status_friend_and_invite:entitiesData];
}

@end
