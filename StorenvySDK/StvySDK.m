//
//  StvySDK.m
//  StvySDK
//
//  Created by Agathe Battestini on 2/18/14.
//  Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvySDK.h"

static StvySDK *_sharedInstance = nil;

@interface StvySDK (Protected)

- (void)setupRestKitMapping;
- (void)setupRestKitStore;

@end

@implementation StvySDK





- (id)init {
    return [self initWithURL:@"https://api.storenvy.com/v1"];
}

- (void)dealloc
{
    [super dealloc];
    NSLog(@"deallocaing?? ");
}

- (id)initWithURL:(NSString *)inBaseURL {
    NSParameterAssert(inBaseURL);
    if (self = [super init]) {
        StvyHTTPClient *client;
        _baseURL = inBaseURL;
        _session = [[StvySession alloc] initWithBaseURL:inBaseURL];
        client = [[StvyHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:inBaseURL] session:_session];
        [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
        _manager = [[StvyObjectManager alloc] initWithHTTPClient:client];
        _api = [[StvyAPI alloc] initWithManager:_manager session:_session];
        [self setupRestKitStore];
        [self setupRestKitMapping];

        if (_sharedInstance == nil) {
            [[self class] setSharedInstance:self];
        }
    }
    return self;
}

#pragma mark - Store specific SDK

+ (StvySDK*)sdkForStoreDomain:(NSString *)store
{
    NSParameterAssert(store);
    StvySDK *sdk = [[StvySDK alloc] initWithURL:[NSString stringWithFormat:@"http://%@.storenvy.com", store]];
    return sdk;
}


#pragma mark - api getter

+ (StvyAPI *)api {
    return [[self sharedInstance] api];
}

#pragma mark - client getter

+ (StvyHTTPClient *)client {
    return (StvyHTTPClient *)[[[self sharedInstance] manager] HTTPClient];
}

#pragma mark - manager getter

+ (StvyObjectManager *)manager {
    return [[self sharedInstance] manager];
}

#pragma mark - session getter

+ (StvySession *)session {
    return [[self sharedInstance] session];
}

#pragma mark - sharedInstance getter/setter

+ (id)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_sharedInstance == nil) {
            _sharedInstance = [[self alloc] init];
        }
    });
    return _sharedInstance;
}

+ (void)setSharedInstance:(StvySDK *)inSharedInstance {
    NSParameterAssert(inSharedInstance);
    _sharedInstance = inSharedInstance;
}

#pragma mark - private methods

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p baseURL:%@>", NSStringFromClass([self class]), self, self.baseURL];
}

#pragma mark - RestKit mapping

- (void)setupRestKitMapping {
    // XXX TODO
    [RKEntityMapping setEntityIdentificationInferenceEnabled:NO];
}

#pragma mark - RestKit response descriptors

//- (RKResponseDescriptor *)restKitErrorDescriptor {
//    // Error mapping
//    return [RKResponseDescriptor responseDescriptorWithMapping:[StvyErrorMessage mapping]
//                                                   pathPattern:nil
//                                                       keyPath:nil
//                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError)];
//}


#pragma mark - RestKit store

- (void)setupRestKitStore {
    NSMutableArray *allBundles = [NSMutableArray array];
    [allBundles addObjectsFromArray:[NSBundle allBundles]];
    [allBundles addObjectsFromArray:[NSBundle allFrameworks]];

//    NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:allBundles];
//    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
//    self.manager.managedObjectStore = managedObjectStore;

//    [managedObjectStore createPersistentStoreCoordinator];
//    NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"StvySDK.sqlite"];
//    NSError *error;
//    NSPersistentStore *persistentStore = [managedObjectStore addSQLitePersistentStoreAtPath:storePath
//                                                                     fromSeedDatabaseAtPath:nil
//                                                                          withConfiguration:nil
//                                                                                    options:nil
//                                                                                      error:&error];
//    NSAssert(persistentStore, @"Failed to add persistent store (%@) with error: %@", storePath, error);

//    // Create the managed object contexts
//    [managedObjectStore createManagedObjectContexts];
//
//    // Configure a managed object cache to ensure we do not create duplicate objects
//    managedObjectStore.managedObjectCache = [[RKInMemoryManagedObjectCache alloc] initWithManagedObjectContext:managedObjectStore.persistentStoreManagedObjectContext];
//
//    [NSManagedObjectContext MR_setRootSavingContext:managedObjectStore.persistentStoreManagedObjectContext];
//    [NSManagedObjectContext MR_setDefaultContext:managedObjectStore.mainQueueManagedObjectContext];
}

@end
