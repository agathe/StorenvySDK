//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import "StvyPublicSDK.h"
#import "StvyObjectPublicCollections.h"
#import "StvyEntityPublicStore.h"
#import "StvyObjectPublicProducts.h"
#import "StvyEntityPublicCollection.h"
#import "StvyEntityPublicProduct.h"

@interface StvyPublicSDK (Protected)

- (void)setupRestKitMapping;
- (void)setupRestKitStore;

@end


@implementation StvyPublicSDK {

}

//+ (id)sharedInstance {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        if (_sharedInstance == nil) {
//            _sharedInstance = [[self alloc] init];
//        }
//    });
//    return _sharedInstance;
//}

- (id)init {
    return [self initWithStoreName:@"lovejunkee"];
}


- (id)initWithStoreName:(NSString *)storeName {
    NSParameterAssert(storeName);
    NSString *url = [NSString stringWithFormat:@"http://%@.storenvy.com", storeName];
    return [self initWithURL:url];
}

#pragma mark - Store specific SDK

+ (StvyPublicSDK*)sdkForStore:(NSString *)store
{
    NSParameterAssert(store);
    StvyPublicSDK *sdk = [[StvyPublicSDK alloc] initWithStoreName:store];
    return sdk;
}

#pragma mark - overriding the mapping for restkit

- (void)setupRestKitMapping {
    [RKEntityMapping setEntityIdentificationInferenceEnabled:NO];
//    [self.manager addResponseDescriptor:[self restKitErrorDescriptor]];
    [self.manager addResponseDescriptorsFromArray:[self restKitCollectionsDescriptors]];
    [self.manager addResponseDescriptorsFromArray:[self restKitStoreDescriptors]];
    [self.manager addResponseDescriptorsFromArray:[self restKitProductsDescriptors]];
}

- (void)setupRestKitStore {

}

- (NSArray *)restKitCollectionsDescriptors {
    return @[
            // http://store.storenvy.com/collections.json
            [RKResponseDescriptor responseDescriptorWithMapping:[StvyObjectPublicCollections mapping]
                                                         method:RKRequestMethodGET
                                                    pathPattern:@"/collections\\.json"
                                                        keyPath:nil
                                                    statusCodes:RKStatusCodeIndexSetForClass
                                                            (RKStatusCodeClassSuccessful)],

            // http://store.storenvy.com/collections/:collectionID.json
            [RKResponseDescriptor responseDescriptorWithMapping:[StvyEntityPublicCollection  mapping]
                                                         method:RKRequestMethodGET
                                                    pathPattern:@"/collections/:collectionID\\.json"
                                                        keyPath:nil
                                                    statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)],

    ];
}


- (NSArray *)restKitStoreDescriptors {
    return @[
            // http://store.storenvy.com/store.json
            [RKResponseDescriptor responseDescriptorWithMapping:[StvyEntityPublicStore mapping]
                                                         method:RKRequestMethodGET
                                                    pathPattern:@"/store\\.json"
                                                        keyPath:nil
                                                    statusCodes:RKStatusCodeIndexSetForClass
                                                            (RKStatusCodeClassSuccessful)],

    ];
}

- (NSArray *)restKitProductsDescriptors {
    return @[
            // http://store.storenvy.com/products.json
            [RKResponseDescriptor responseDescriptorWithMapping:[StvyObjectPublicProducts mapping]
                                                         method:RKRequestMethodGET
                                                    pathPattern:@"/products\\.json"
                                                        keyPath:nil
                                                    statusCodes:RKStatusCodeIndexSetForClass
                                                            (RKStatusCodeClassSuccessful)],

            // http://store.storenvy.com/products/:productID.json
            [RKResponseDescriptor responseDescriptorWithMapping:[StvyEntityPublicProduct  mapping]
                                                         method:RKRequestMethodGET
                                                    pathPattern:@"/products/:productID\\.json"
                                                        keyPath:nil
                                                    statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)],

    ];

}




@end