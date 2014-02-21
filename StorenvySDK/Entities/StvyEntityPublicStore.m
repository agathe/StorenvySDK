//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvyEntityPublicStore.h"
#import "StvyAPI.h"


@implementation StvyEntityPublicStore {

}

+ (RKObjectMapping *)mapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:self];

    [mapping addAttributeMappingsFromDictionary:@{
            @"id":                             @"storeID",
            @"name":                           @"name",
            @"subdomain":                      @"subdomain",
            @"url":                            @"url",
            @"marketplace_url":                @"marketplaceUrl",
            @"location":                       @"location",
//            @"avatar":                         @"avatarUrl",
    }];


    RKAttributeMapping *titleMapping = [RKAttributeMapping attributeMappingFromKeyPath:@"avatar" toKeyPath:@"avatarUrl"];
    titleMapping.valueTransformer = [StvyAPI urlPrefixValueTransformer];
    [mapping addAttributeMappingsFromArray:@[titleMapping]];

    return mapping;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p name:%@ >", NSStringFromClass([self class]), self, self.name];
}

@end