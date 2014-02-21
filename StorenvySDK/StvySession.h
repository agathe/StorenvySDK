//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StvySession : NSObject

typedef void (^AuthCompletionBlock)(BOOL authorized, NSError *error);

@property (nonatomic, strong, readonly) NSString *baseURL;

- (id)initWithBaseURL:(NSString *)inBaseURL;

- (BOOL)isAuthenticated;


@end