//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvySession.h"
#import <RestKit/RestKit.h>

#define kAppName [[NSBundle mainBundle] bundleIdentifier]

@interface StvySession ()

@property (nonatomic, copy) AuthCompletionBlock block;

@end


@implementation StvySession {

}

- (id)initWithBaseURL:(NSString *)inBaseURL {
    if (self = [super init]) {
        _baseURL = inBaseURL;
    }
    return self;
}

- (BOOL)isAuthenticated {
    return NO;
}



@end