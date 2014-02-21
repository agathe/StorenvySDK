//
//  StvyPublicMappingTest.m
//  StvySDK
//
//  Created by Johannes Plunien on 12/21/12.
//  Copyright (c) 2013 Johannes Plunien. All rights reserved.
//

#import "StvyPublicMappingTest.h"

@implementation StvyPublicMappingTest

- (NSDictionary *)mappingData:(NSString *)type {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:type ofType:@"json"];
    NSError *error = nil;
    NSData *payload = [NSData dataWithContentsOfFile:path options:0 error:&error];
    NSAssert(error == nil, @"Read mapping data");
    NSDictionary *result;
    result = [NSJSONSerialization JSONObjectWithData:payload options:kNilOptions error:&error];
    NSAssert(error == nil, @"Load mapping data");
    return result;
}

//- (id)mappingForClass:(id)thing {
////    return [thing mappingInManagedObjectStore:[StvySDK manager].managedObjectStore];
//}

//- (RKMappingTest *)testForMapping:(RKObjectMapping *)mapping withData:(id)data {
//    RKMappingTest *mappingTest = [[RKMappingTest alloc] initWithMapping:mapping
//                                                           sourceObject:data
//                                                      destinationObject:nil];
////    mappingTest.mappingOperationDataSource = [[RKManagedObjectMappingOperationDataSource alloc]
////                                              initWithManagedObjectContext:XingSDK.manager.managedObjectStore.mainQueueManagedObjectContext
////                                              cache:[RKFetchRequestManagedObjectCache new]];
//    return mappingTest;
//}

@end
