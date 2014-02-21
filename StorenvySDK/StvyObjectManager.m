//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvyObjectManager.h"
#import "StvyHTTPClient.h"

@interface RKObjectManager (StvySDK)

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters;

@end




@implementation StvyObjectManager {

}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters {
    NSMutableURLRequest *request = [super requestWithMethod:method path:path parameters:parameters];
    [(StvyHTTPClient *)self.HTTPClient signRequest:request];
    return request;
}

@end