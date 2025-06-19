//
//  CUBFriendDataManagerTests.m
//  CUBFriendDataManagerTests
//
//  Created by 黃崑展 on 2025/6/18.
//  Copyright © 2025 KunChan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CUBFriendDataManager.h"

@interface CUBFriendDataManagerTests : XCTestCase

@end

@implementation CUBFriendDataManagerTests

- (void)setUp {
    [super setUp];
    // 在每個 test 方法執行前呼叫，通常用來初始化測試環境
}

- (void)tearDown {
    // 在每個 test 方法執行後呼叫，通常用來清理狀態
    [super tearDown];
}

- (void)testExample {
    // 這是一個範例測試方法。
    // 使用 XCTAssert 判斷條件是否成立。
    XCTAssertTrue(1 == 1, @"1 應該等於 1");
}

- (void)testPerformanceExample {
    // 這是效能測試的範例
    //[self measureBlock:^{
        // 把你想要測試效能的程式碼寫在這裡
    //}];
}

//CUBFriendDataManager getFriend1 打api成功測試
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

//CUBFriendDataManager getFriend1 打api失敗測試
- (void)testGetFriend1ReturnsErrorOnFailure {
    XCTestExpectation *expectation = [self expectationWithDescription:@"getFriend1 錯誤回傳"];

    CUBFriendDataManager *manager = [[CUBFriendDataManager alloc] init];
    manager.shouldFailForTesting = YES;
    
    [manager getFriend1Success:^(NSArray *success) {
        XCTFail(@"不應該進入成功 callback");
    } failure:^(NSError *error) {
        XCTAssertNotNil(error, @"錯誤不可為 nil");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

@end
