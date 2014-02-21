//
//  StvySDKLoadingTest.m
//  StorenvySDK
//
//  Created by Agathe Battestini on 2/20/14.
//  Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <SenTestingKit/SenTestingKit.h>
#import <RestKit/RestKit.h>
#import <RestKit/Testing.h>
//#import "StvyEntities.h"
#import "StvySDK.h"
#import "StvyPublicSDK.h"
#import <Expecta/Expecta.h>
#define EXP_SHORTHAND

@interface StvySDKLoadingTest : SenTestCase

@end

@implementation StvySDKLoadingTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{
//    STFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    StvyPublicSDK * sdk = [[StvyPublicSDK alloc] initWithStoreName:@"lovejunkee"];

    __block BOOL done = NO;
    [sdk.api.loadStore subscribeNext:^(id x) {
        NSLog(@"Store %@", x);
        done = YES;
    } error:^(NSError *error) {
        NSLog(@"ERROR loading result: %@", error);
        done = YES;
    }];
    
    do {
        NSDate *stopDate = [NSDate dateWithTimeIntervalSinceNow:0.001];
        [[NSRunLoop currentRunLoop] runUntilDate:stopDate];
//        NSAssert([timeoutDate timeIntervalSinceNow] > 0.0, @"Timed out");
    } while (!done);

}

@end
