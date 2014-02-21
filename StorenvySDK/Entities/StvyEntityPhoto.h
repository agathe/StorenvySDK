//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/CoreData.h>
#import <RestKit/RestKit.h>

/**
 # Properties

 * homepage
 * small
 * medium
 * large
 * original
 * 64w
 * 200w
 * 400w
 * 1000w
 * 64sq
 * 200sq
 * 400sq

 # Relationships

 * product -> StvyEntityPublicProduct -> photos

 */

@interface StvyEntityPhoto : NSObject

@property (nonatomic, copy) NSURL * homepage;
@property (nonatomic, copy) NSURL * small;
@property (nonatomic, copy) NSURL * medium;
@property (nonatomic, copy) NSURL * large;
@property (nonatomic, copy) NSURL * original;
@property (nonatomic, copy) NSURL * w64;
@property (nonatomic, copy) NSURL * w200;
@property (nonatomic, copy) NSURL * w400;
@property (nonatomic, copy) NSURL * w1000;
@property (nonatomic, copy) NSURL * sq64;
@property (nonatomic, copy) NSURL * sq200;
@property (nonatomic, copy) NSURL * sq400;


+ (RKObjectMapping *)mapping;

@end