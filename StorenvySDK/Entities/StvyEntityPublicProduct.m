//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvyEntityPublicProduct.h"
#import "StvyEntityPhoto.h"
#import "StvyEntityPublicStore.h"
#import "StvyEntityPublicCollection.h"


@implementation StvyEntityPublicProduct {

}

+ (RKEntityMapping *)mapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:self];

    [mapping addAttributeMappingsFromDictionary:@{
            @"id":                             @"productID",
            @"name":                           @"name",
            @"description":                    @"description",
            @"short_url":                      @"shortUrl",
            @"status":                         @"status",
            @"labels":                         @"labels",
            @"preorder":                       @"preorder",
            @"on_sale":                        @"onSale",
            @"store_id":                       @"storeID",
            @"price":                          @"price",
            @"marketplace_category":           @"marketplaceCategory",
            @"marketplace_category_id":        @"marketplaceCategoryID",
    }];

    RKRelationshipMapping *relationshipMapping = nil;
    // photos
    relationshipMapping = [RKRelationshipMapping relationshipMappingFromKeyPath:@"photos"
                                                                      toKeyPath:@"photos"
                                                                    withMapping:[StvyEntityPhoto mapping]];
    [mapping addPropertyMapping:relationshipMapping];

    // store
    relationshipMapping = [RKRelationshipMapping relationshipMappingFromKeyPath:@"store"
                                                                      toKeyPath:@"store"
                                                                    withMapping:[StvyEntityPublicStore mapping]];
    [mapping addPropertyMapping:relationshipMapping];

    // collections
    relationshipMapping = [RKRelationshipMapping relationshipMappingFromKeyPath:@"collections"
                                                                      toKeyPath:@"collections"
                                                                    withMapping:[StvyEntityPublicCollection mappingPrefixedCollection]];
    [mapping addPropertyMapping:relationshipMapping];


    return mapping;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p name:%@ price:%@>", NSStringFromClass([self class]), self, self.name,
                    self.price];
}

@end