//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvyAPI+Store.h"
#import "StvyAPIResponse.h"


@implementation StvyAPI (Store)


- (RACSignal *)loadStore
{
    NSString *path = [NSString stringWithFormat:@"/store.json"];
    RACReplaySubject *subject = [RACReplaySubject subject];
    [[self getRequestAtPath:path parameters:nil] subscribeNext:^(StvyAPIResponse *response) {
        [subject sendNext:response];
        [subject sendCompleted];
    } error:^(NSError *error) {
        [subject sendError:error];
    }];
    return subject;
}

@end