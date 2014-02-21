//
//  StvyPublicAPITest.h
//  StvySDK
//
//

#import "StvyTest.h"

@interface StvyPublicAPITest : StvyTest

@property (nonatomic, strong) StvyPublicSDK *sdk;
@property (nonatomic, assign) float timeout;

- (StvyAPI *)api;
- (StvySession *)session;

- (void)waitFor:(RACSignal *)subject result:(NSObject **)result timeout:(float)timeout;
- (void)waitFor:(RACSignal *)subject result:(NSObject **)result;
- (void)waitFor:(RACSignal *)subject timeout:(float)timeout;
- (void)waitFor:(RACSignal *)subject;

@end
