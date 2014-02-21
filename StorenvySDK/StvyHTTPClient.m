//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvyHTTPClient.h"

@interface StvyHTTPClient ()

@property (nonatomic, strong) StvySession *session;

@end


@implementation StvyHTTPClient {

}

- (id)initWithBaseURL:(NSURL *)url session:(StvySession *)session {
    if (self = [super initWithBaseURL:url]) {
        _session = session;
    }
    return self;
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters {
    return [self signRequest:[super requestWithMethod:method path:path parameters:parameters]];
}

- (NSMutableURLRequest *)signRequest:(NSMutableURLRequest *)request {
    return request;
}


@end