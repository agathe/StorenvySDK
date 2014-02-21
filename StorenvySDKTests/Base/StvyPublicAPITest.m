//
//  StvyPublicAPITest.m
//  StvySDK
//

//#import <SenTestingKit/SenTestingKit.h>
#import "StvyPublicAPITest.h"


@interface StvyPublicAPITest ()

@end

@implementation StvyPublicAPITest

- (void)setUp {
    [super setUp];
    [self setupSDK];
    self.timeout = 20.0f;
}

- (void)setupSDK {
    self.sdk = [[StvyPublicSDK alloc] initWithStoreName:@"lovejunkee"];
}

#pragma mark - Public methods

- (StvyAPI *)api {
    return self.sdk.api;
}

- (StvySession *)session {
    return self.sdk.session;
}


- (void)waitFor:(RACSignal *)subject result:(NSObject **)result {
    [self waitFor:subject result:result timeout:self.timeout];
}

- (void)waitFor:(RACSignal *)subject {
    [self waitFor:subject timeout:self.timeout];
}

- (void)waitFor:(RACSignal *)subject result:(NSObject **)result timeout:(float)timeout {
    __block id next;
    [subject subscribeNext:^(id x) {
        next = x;
    } error:^(NSError *error) {
        NSLog(@"ERROR loading result: %@", error);
    }];
    [self waitFor:subject timeout:timeout];
    *result = next;
}

- (void)waitFor:(RACSignal *)subject timeout:(float)timeout {
    NSDate *timeoutDate = [NSDate dateWithTimeIntervalSinceNow:timeout];
    __block BOOL done = NO;
    [subject subscribeError:^(NSError *error) {
        done = YES;
    } completed:^{
        done = YES;
    }];
    do {
        NSDate *stopDate = [NSDate dateWithTimeIntervalSinceNow:0.001];
        [[NSRunLoop currentRunLoop] runUntilDate:stopDate];
        NSAssert([timeoutDate timeIntervalSinceNow] > 0.0, @"Timed out");
    } while (!done);
}

@end
