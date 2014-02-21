//
//  StvyAPIPublicCollectionsTest.m
//  StorenvySDK
//
//  Created by Agathe Battestini on 2/20/14.
//  Copyright (c) 2014 Storenvy. All rights reserved.
//

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <SenTestingKit/SenTestingKit.h>
#import "StvyPublicAPITest.h"
#import "StvyEntityPublicStore.h"
#import "StvyObjectPublicCollections.h"
#import "StvyEntityPublicCollection.h"

@interface StvyAPIPublicCollectionsTest : StvyPublicAPITest

@end

@implementation StvyAPIPublicCollectionsTest

- (void)testLoadCollections
{
    StvyAPIResponse *response = nil;
    [self waitFor:self.api.loadCollections result:&response];

    StvyObjectPublicCollections *collections = (StvyObjectPublicCollections *)response.resultObject;

    expect(collections).notTo.beNil();
    expect(collections).to.beInstanceOf(StvyObjectPublicCollections.class);
    expect(collections.items).notTo.beNil();
    expect(collections.items.count).to.beGreaterThan(0);
    StvyEntityPublicCollection *collection = [[collections.items allObjects] firstObject];
    expect(collection).to.beInstanceOf(StvyEntityPublicCollection.class);
//    NSString *firstcollectionName = @"All Products";
    expect(collection.name.length).to.beGreaterThanOrEqualTo(3);
    expect(collection.productIDs.count).to.beGreaterThanOrEqualTo(1);
//    NSLog(@"collection %@",collection);
}

@end
