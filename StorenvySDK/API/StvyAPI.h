//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "StvyObjectManager.h"
#import <NSManagedObject+MagicalFinders.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <RestKit/RestKit.h>
#import "SPDeepCopy.h"

//#import "StvyAPIConstants.h"
//#import "StvyAPIResponse.h"
//#import "StvyEntities.h"
//#import "StvyErrorMessage.h"
#import "StvySession.h"

@class StvySession;


@interface StvyAPI : NSObject

@property (nonatomic, readonly) StvyObjectManager *manager;
@property (nonatomic, readonly) StvySession *session;
@property (nonatomic, readonly) RACSubject *globalSignal;
//@property (nonatomic, strong) NSManagedObjectContext *context;

- (id)initWithManager:(StvyObjectManager *)inManager session:(StvySession *)inSession;
- (RACSignal *)deleteRequestAtPath:(NSString *)path parameters:(NSDictionary *)parameters;
- (RACSignal *)getRequestAtPath:(NSString *)path parameters:(NSDictionary *)parameters;
- (RACSignal *)postRequestAtPath:(NSString *)path parameters:(NSDictionary *)parameters;
- (RACSignal *)putRequestAtPath:(NSString *)path parameters:(NSDictionary *)parameters;
- (void)withLimit:(int)limit andTotal:(int)total callBlock:(void (^)(int offset))block;


@end