//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvyEntityPublicCollection.h"
#import "StvyEntityPublicProduct.h"


@implementation StvyEntityPublicCollection {

}

+ (RKEntityMapping *)mapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:self];

    [mapping addAttributeMappingsFromDictionary:@{
            @"id":                             @"collectionID",
            @"name":                           @"name",
            @"description":                    @"description",
            @"primary":                        @"primary",
            @"hide_in_storefront_navigation":  @"hideInStorefrontNavigation",
            @"photo":                          @"photoUrl",
            @"products":                       @"productIDs",
    }];

    RKRelationshipMapping *relationshipMapping = nil;


    return mapping;
}

+ (RKEntityMapping *)mappingPrefixedCollection
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:self];

    [mapping addAttributeMappingsFromDictionary:@{
            @"collection.id":                             @"collectionID",
            @"collection.name":                           @"name",
            @"collection.description":                    @"description",
            @"collection.primary":                        @"primary",
            @"collection.hide_in_storefront_navigation":  @"hideInStorefrontNavigation",
            @"collection.photo":                          @"photoUrl",
            @"products":                       @"productIDs",
    }];

    RKRelationshipMapping *relationshipMapping = nil;


    return mapping;
}


- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p name:%@ %d products>", NSStringFromClass([self class]), self, self.name,
                    self.productIDs.count];
}

@end