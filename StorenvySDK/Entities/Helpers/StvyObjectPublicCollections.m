//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvyObjectPublicCollections.h"
#import "StvyEntityPublicCollection.h"


@implementation StvyObjectPublicCollections {

}

+ (RKObjectMapping *)mapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];

//    [mapping addAttributeMappingsFromArray:@[@"total"]];
    [mapping addPropertyMapping:
            [RKRelationshipMapping relationshipMappingFromKeyPath:@"collections"
                                                        toKeyPath:@"items"
                                                      withMapping:[StvyEntityPublicCollection mapping]]];
    return mapping;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p items:%u>", NSStringFromClass([self class]), self, self.items.count];
}


@end