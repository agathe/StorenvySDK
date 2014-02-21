//
// Created by Agathe Battestini on 2/20/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvyObjectPublicProducts.h"
#import "StvyEntityPublicProduct.h"


@implementation StvyObjectPublicProducts {

}
+ (RKObjectMapping *)mapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];

//    [mapping addAttributeMappingsFromArray:@[@"total"]];
    [mapping addPropertyMapping:
            [RKRelationshipMapping relationshipMappingFromKeyPath:@"products"
                                                        toKeyPath:@"items"
                                                      withMapping:[StvyEntityPublicProduct mapping]]];
    return mapping;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p items:%u>", NSStringFromClass([self class]), self, self.items.count];
}

@end