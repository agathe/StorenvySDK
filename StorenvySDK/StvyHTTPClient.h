//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"
#import "StvySession.h"

@interface StvyHTTPClient : AFHTTPClient

- (id)initWithBaseURL:(NSURL *)url session:(StvySession *)session;

- (NSMutableURLRequest *)signRequest:(NSMutableURLRequest *)request;


@end