//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvyAPI.h"
#import "StvyAPIResponse.h"


@implementation StvyAPI {

}

- (id)initWithManager:(StvyObjectManager *)inManager session:(StvySession *)inSession {
    if (self = [super init]) {
        _globalSignal = [RACSubject subject];
        _manager = inManager;
        _session = inSession;
    }
    return self;
}

- (RACSignal *)enqueueObjectRequestOperation:(RKManagedObjectRequestOperation *)operation {
    __weak __typeof(&*self)weakSelf = self;
    RACReplaySubject *subject = [RACReplaySubject subject];

//    operation.managedObjectContext = self.context;

    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *inOperation, RKMappingResult *mappingResult) {
        RKManagedObjectRequestOperation *operation = (RKManagedObjectRequestOperation *)inOperation;
        [subject sendNext:[StvyAPIResponse responseWithOperation:operation result:mappingResult]];
        [subject sendCompleted];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [subject sendError:[weakSelf transformError:error operation:operation]];
    }];

    [operation setWillMapDeserializedResponseBlock:^id(id deserializedResponseBody) {
        return [weakSelf transformResponse:deserializedResponseBody];
    }];

    [subject subscribeNext:^(id x) {
        [weakSelf.globalSignal sendNext:x];
    } error:^(NSError *error) {
        [weakSelf.globalSignal sendError:error];
    }];

    [self.manager enqueueObjectRequestOperation:operation];

    return subject;
}

- (RACSignal *)deleteRequestAtPath:(NSString *)path parameters:(NSDictionary *)parameters {
    RKManagedObjectRequestOperation *operation = [self.manager appropriateObjectRequestOperationWithObject:nil
                                                   method:RKRequestMethodDELETE path:path parameters:parameters];
    return [self enqueueObjectRequestOperation:operation];
}

- (RACSignal *)getRequestAtPath:(NSString *)path parameters:(NSDictionary *)parameters {
    RKManagedObjectRequestOperation *operation = [self.manager appropriateObjectRequestOperationWithObject:nil
                                                   method:RKRequestMethodGET path:path parameters:parameters];
    return [self enqueueObjectRequestOperation:operation];
}

- (RACSignal *)postRequestAtPath:(NSString *)path parameters:(NSDictionary *)parameters {
    RKManagedObjectRequestOperation *operation = [self.manager appropriateObjectRequestOperationWithObject:nil
                                                    method:RKRequestMethodPOST path:path parameters:parameters];
    return [self enqueueObjectRequestOperation:operation];
}

- (RACSignal *)putRequestAtPath:(NSString *)path parameters:(NSDictionary *)parameters {
    RKManagedObjectRequestOperation *operation = [self.manager appropriateObjectRequestOperationWithObject:nil
                                                     method:RKRequestMethodPUT path:path parameters:parameters];
    return [self enqueueObjectRequestOperation:operation];
}

- (NSError *)transformError:(NSError *)error operation:(RKObjectRequestOperation *)operation {
    // XXX TODO
//    StvyErrorMessage *stvyError = (StvyErrorMessage *)error.userInfo[RKObjectMapperErrorObjectsKey][0];
//    if (stvyError != nil) {
//        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: stvyError.errorMessage, StvyAPIErrorKey: stvyError};
//        return [[NSError alloc] initWithDomain:@"com.storenvy.StvySDK.HTTPErrorDomain"
//                                          code:operation.HTTPRequestOperation.response.statusCode
//                                      userInfo:userInfo];
//    }
    return error;
}

- (id)transformResponse:(id)response {
    
    // we get a flat array of dictionaries [ {..},{..}] representing each a product -> add root keypath {products: [...]}
    if ([response isKindOfClass:NSArray.class] && [response firstObject][@"marketplace_category_id"] && [response firstObject][@"price"]) {
        return [self transformResponseProducts:response];
    }
    
//    if ([response isKindOfClass:NSDictionary.class] && (response[@"collections"])) {
//        return [self transformResponseCollections:response];
//    }
    return response;
}

- (id)transformResponseCollections:(id)response {
    NSMutableDictionary *data = [(NSDictionary *)response mutableDeepCopy];
    if ([data[@"collections"] isKindOfClass:NSArray.class]) {
        for (NSMutableDictionary *row in data[@"collections"]) {
            row[@"ids"] = [(NSArray *)row[@"ids"] componentsJoinedByString:@","];
        }
    }
    return data;
}

- (id)transformResponseProducts:(id)response {
    // Add a root keypath to make the mapping work
    return @{ @"products": response };
}


- (void)withLimit:(int)limit andTotal:(int)total callBlock:(void (^)(int offset))block {
    int offset = 0;
    do {
        block(offset);
        offset += limit;
    } while (offset < total);
}


@end