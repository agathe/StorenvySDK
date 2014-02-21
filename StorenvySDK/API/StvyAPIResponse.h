//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface StvyAPIResponse : NSObject

@property (nonatomic, strong) RKManagedObjectRequestOperation *operation;
@property (nonatomic, strong) RKMappingResult *result;

+ (id)responseWithOperation:(RKManagedObjectRequestOperation *)inOperation result:(RKMappingResult *)inResult;
- (id)resultObject;


@end