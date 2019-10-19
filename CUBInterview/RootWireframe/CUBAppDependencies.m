//
//  CUBAppDependencies.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBAppDependencies.h"
#import "CUBRootWireframe.h"

@implementation CUBAppDependencies

+ (instancetype)sharedInstance {
    
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[super allocWithZone:NULL] init];
    });
    return sharedInstance;
    
}

+ (id)allocWithZone:(struct _NSZone*)zone {
    
    return [self sharedInstance];

}

- (id)init {
    
    if ((self = [super init])) {
        
        [self configureDependencies];

    }
    return self;
    
}

#pragma mark - public
- (void)installRootViewControllerIntoWindow:(UIWindow *)window {
    
    [self.rootWireframe installRootViewControllerIntoWindow:window];
    
}


#pragma mark - private
- (void)configureDependencies {
    
     _rootWireframe = [[CUBRootWireframe alloc] init];
    
}

@end
