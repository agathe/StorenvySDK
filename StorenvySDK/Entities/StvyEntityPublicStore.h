//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/CoreData.h>
#import <RestKit/RestKit.h>

/**
 # Properties

 * url
 * name
 * subdomain
 * location
 * avatarUrl
 * marketplaceUrl

 # Relationships

 * products -> StvyEntityPublicProduct -> ?

 */
@interface StvyEntityPublicStore : NSObject


@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSNumber* storeID;
@property (nonatomic, copy) NSURL* url;
@property (nonatomic, copy) NSString* subdomain;
@property (nonatomic, copy) NSString* location;
@property (nonatomic, copy) NSURL* avatarUrl;
@property (nonatomic, copy) NSString* marketplaceUrl;

+ (RKEntityMapping *)mapping;

@end