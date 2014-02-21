//
//  StvySDK.h
//  StvySDK
//
//  Created by Agathe Battestini on 2/18/14.
//  Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
//#import <MagicalRecord/CoreData+MagicalRecord.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <RestKit/RestKit.h>

#import "StvyObjectManager.h"
#import "StvyAPI.h"
#import "StvyAPICategories.h"
#import "StvyAPIResponse.h"
#import "StvyHTTPClient.h"

//#import "StvyEntities.h"


@interface StvySDK : NSObject
{
    NSString *_baseURL;
    StvyObjectManager *_manager;
    StvyAPI *_api;
    StvySession *_session;
}

@property (nonatomic, strong, readonly) NSString *baseURL;
@property (nonatomic, strong, readonly) StvyObjectManager *manager;
@property (nonatomic, strong, readonly) StvyAPI *api;
@property (nonatomic, strong, readonly) StvySession *session;

/**
 Return an instance of StvySDK with a custom base URL.

 @param inBaseURL The base URL that should be used.
 @return A new StvySDK instance.
 */
- (id)initWithURL:(NSString *)inBaseURL;

///--------------------------------------------
/// @name Access objects of the shared instance
///--------------------------------------------

/**
 Return the StvyAPI object that is used by the shared instance.

 @return The StvyAPI object that is used by the shared instance.
 */
+ (StvyAPI *)api;

/**
 Return the StvyHTTPClient object that is used by the shared instance.

 @return The StvyHTTPClient object that is used by the shared instance.
 */
+ (StvyHTTPClient *)client;

/**
 Return the StvyObjectManager object that is used by the shared instance. See also:
 [RKObjectManager](http://restkit.org/api/0.20.0/Classes/RKObjectManager.html)

 @return The StvyObjectManager object that is used by the shared instance.
 */
+ (StvyObjectManager *)manager;

/**
 Return the StvySession object that is used by the shared instance.

 @return The StvySession object that is used by the shared instance.
 */
+ (StvySession *)session;

///------------------------------------
/// @name Replacing the shared instance
///------------------------------------

/**
 Set/replace the StvySDK shared instance.

 @param inSharedInstance The new shared StvySDK instance.
 */
+ (void)setSharedInstance:(StvySDK *)inSharedInstance;

+ (id)sharedInstance;

@end
