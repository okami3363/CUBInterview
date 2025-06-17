//
//  CUBInterviewTests.m
//  CUBInterviewTests
//
//  Created by 黃崑展 on 2025/6/18.
//  Copyright © 2025 KunChan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CUBFriendDataManager.h"

@interface CUBInterviewTests : XCTestCase

@end

@implementation CUBInterviewTests

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    
    [super tearDown];
}

- (void)testExample {
    
}

- (void)testGetFriend1ReturnsArrayOnSuccess {
    XCTestExpectation *expectation = [self expectationWithDescription:@"getFriend1 成功回傳"];

    CUBFriendDataManager *manager = [[CUBFriendDataManager alloc] init];
    
    [manager getFriend1Success:^(NSArray *success) {
        XCTAssertNotNil(success, @"回傳資料不可為 nil");
        XCTAssertTrue([success isKindOfClass:[NSArray class]], @"回傳資料應為 NSArray");
        [expectation fulfill];
    } failure:^(NSError *error) {
        XCTFail(@"不應該進到失敗 callback：%@", error);
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:nil];
}


//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
