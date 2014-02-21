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

@property (nonatomic, copy) NSString * homepage;
@property (nonatomic, copy) NSString * small;
@property (nonatomic, copy) NSString * medium;
@property (nonatomic, copy) NSString * large;
@property (nonatomic, copy) NSString * original;
@property (nonatomic, copy) NSString * w64;
@property (nonatomic, copy) NSString * w200;
@property (nonatomic, copy) NSString * w400;
@property (nonatomic, copy) NSString * w1000;
@property (nonatomic, copy) NSString * sq64;
@property (nonatomic, copy) NSString * sq200;
@property (nonatomic, copy) NSString * sq400;


+ (RKEntityMapping *)mapping;

@end