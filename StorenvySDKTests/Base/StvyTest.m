//
//  StvyTest.m
//  StvySDK
//

#import "StvyTest.h"

@implementation StvyTest

+ (void)initialize {
    // Ensure the required directories exist
    BOOL directoryExists;
    NSError *error = nil;

    directoryExists = RKEnsureDirectoryExistsAtPath(RKApplicationDataDirectory(), &error);
    if (!directoryExists) {
        RKLogError(@"Failed to create application data directory. Unable to run tests: %@", error);
        NSAssert(directoryExists, @"Failed to create application data directory.");
    }

    directoryExists = RKEnsureDirectoryExistsAtPath(RKCachesDirectory(), &error);
    if (!directoryExists) {
        RKLogError(@"Failed to create caches directory. Unable to run tests: %@", error);
        NSAssert(directoryExists, @"Failed to create caches directory.");
    }
}


@end
