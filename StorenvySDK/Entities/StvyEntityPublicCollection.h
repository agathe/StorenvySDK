//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/CoreData.h>
#import <RestKit/RestKit.h>

/**
 # Properties

 * collectionId
 * name
 * description
 * primary
 * hideInStorefrontNavigation
 * photoUrl

 # Relationships

 * products -> StvyEntityPublicProduct -> ?

 */


@interface StvyEntityPublicCollection : NSObject

@property (nonatomic, copy) NSNumber* collectionID;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* description;
@property (nonatomic, assign) BOOL primary;
@property (nonatomic, assign) BOOL hideInStorefrontNavigation;
@property (nonatomic, copy) NSURL* photoUrl;

@property (nonatomic, strong) NSOrderedSet* productIDs;
@property (nonatomic, strong) NSOrderedSet* products;


+ (RKEntityMapping *)mapping;

+ (RKEntityMapping *)mappingPrefixedCollection;

@end