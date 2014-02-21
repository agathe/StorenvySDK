//
// Created by Agathe Battestini on 2/20/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

/**
 # Properties

 * items
 * total

 */

@interface StvyObjectPublicProducts : NSObject

@property (nonatomic, strong) NSArray *items;

+ (RKObjectMapping *)mapping;


@end