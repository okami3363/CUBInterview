//
//  CUBFriendInteractor.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CUBFriendInteractor : NSObject

- (void)get_status_no_friend:(void(^)(NSArray*))entitiesData;
- (void)get_status_friend:(void(^)(NSArray*))entitiesData;
- (void)get_status_friend_and_invite:(void(^)(NSArray*))entitiesData;

@end

NS_ASSUME_NONNULL_END
