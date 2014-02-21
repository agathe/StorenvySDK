//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvyEntityPhoto.h"
#import "StvyAPI.h"


@implementation StvyEntityPhoto {

}

+ (RKObjectMapping *)mapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:self];


//    [mapping addAttributeMappingsFromDictionary:@{
//    }];

    NSDictionary * atts = @{
            @"photo.homepage":                        @"homepage",
            @"photo.small":                           @"small",
            @"photo.medium":                          @"medium",
            @"photo.large":                           @"large",
            @"photo.original":                        @"original",
            @"photo.64w":                             @"w64",
            @"photo.200w":                            @"w200",
            @"photo.400w":                            @"w400",
            @"photo.1000w":                           @"w1000",
            @"photo.64sq":                            @"sq64",
            @"photo.200sq":                           @"sq200",
            @"photo.400sq":                           @"sq400",
    };
    [atts enumerateKeysAndObjectsUsingBlock:^(NSString* key, NSString* obj, BOOL *stop) {
        RKAttributeMapping *urlMapping = [RKAttributeMapping attributeMappingFromKeyPath:key toKeyPath:obj];
        urlMapping.valueTransformer = [StvyAPI urlPrefixValueTransformer];
        [mapping addAttributeMappingsFromArray:@[urlMapping]];
    }];

//    titleMapping.valueTransformer = [StvyAPI urlPrefixValueTransformer];


//    [mapping addAttributeMappingsFromArray:@[titleMapping, titleMapping2]];


    return mapping;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p name:%@ %@>", NSStringFromClass([self class]), self,
                                      self.homepage];
}

@end