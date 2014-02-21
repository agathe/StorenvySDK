//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvyAPIResponse.h"


@implementation StvyAPIResponse {

}

+ (id)responseWithOperation:(RKManagedObjectRequestOperation *)inOperation result:(RKMappingResult *)inResult {
    return [[self alloc] initWithOperation:inOperation result:inResult];
}

- (id)initWithOperation:(RKManagedObjectRequestOperation *)inOperation result:(RKMappingResult *)inResult {
    if (self = [super init]) {
        _operation = inOperation;
        _result = inResult;
    }
    return self;
}

- (id)resultObject {
    return self.result.array.lastObject;
}


@end