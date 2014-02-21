//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

/**
 # Properties

 * items
 * total

 */
@interface StvyObjectPublicCollections : NSObject

@property (nonatomic, strong) NSSet *items;

+ (RKObjectMapping *)mapping;

@end