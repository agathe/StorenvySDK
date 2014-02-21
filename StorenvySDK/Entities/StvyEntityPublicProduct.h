//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/CoreData.h>
#import <RestKit/RestKit.h>
#import "StvyEntityPublicStore.h"


/**
 # Properties

 * productID
 * name
 * description
 * status
 * labels
 * preorder
 * onSale
 * storeId
 * price
 * marketplaceCategory
 * marketplaceCategoryID
 * shortUrl

 # Relationships

 * photos -> StvyEntityPublicProductPhoto -> product
 * collections -> StvyEntityPublicCollection -> products
 * store -> StvyEntityPublicStore -> products

 */


@interface StvyEntityPublicProduct : NSObject

@property (nonatomic, copy) NSNumber* productID;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* description;
@property (nonatomic, copy) NSString* shortUrl;
@property (nonatomic, copy) NSString* status;
@property (nonatomic, copy) NSString* labels;
@property (nonatomic, assign) BOOL preorder;
@property (nonatomic, assign) BOOL onSale;
@property (nonatomic, copy) NSNumber* storeID;
@property (nonatomic, copy) NSString* price;
@property (nonatomic, copy) NSString* marketplaceCategory;
@property (nonatomic, copy) NSNumber* marketplaceCategoryID;

@property (nonatomic, strong) StvyEntityPublicStore *store;
@property (nonatomic, strong) NSSet * photos;
@property (nonatomic, strong) NSSet * collections;

+ (RKEntityMapping *)mapping;

@end