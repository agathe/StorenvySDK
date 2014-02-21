//
//  StvyAPIPublicProductsTest.m
//  StorenvySDK
//
//  Created by Agathe Battestini on 2/20/14.
//  Copyright (c) 2014 Storenvy. All rights reserved.
//

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <SenTestingKit/SenTestingKit.h>
#import "StvyPublicAPITest.h"
#import "StvyObjectPublicProducts.h"
#import "StvyEntityPublicProduct.h"
#import "StvyEntityPhoto.h"


@interface StvyAPIPublicProductsTest : StvyPublicAPITest

@end

@implementation StvyAPIPublicProductsTest

- (void)testLoadProducts
{
    StvyAPIResponse *response = nil;
    [self waitFor:self.api.loadProducts result:&response];

    StvyObjectPublicProducts *products = (StvyObjectPublicProducts *)response.resultObject;

    expect(products).notTo.beNil();
    expect(products).to.beInstanceOf(StvyObjectPublicProducts.class);
    expect(products.items).notTo.beNil();
    NSLog(@"products %@", products);
    expect(products.items.count).to.beGreaterThan(10);

    // one product
    StvyEntityPublicProduct *product = [products.items firstObject];
    NSLog(@"Product: %@",product);
    expect(product).to.beInstanceOf(StvyEntityPublicProduct.class);
    expect(product.name.length).to.beGreaterThanOrEqualTo(3);
    expect([NSNumber numberWithInteger:product.price.integerValue] ).to.beGreaterThanOrEqualTo(1);

    // photos
    expect(product.photos.count).to.beGreaterThanOrEqualTo(1);
    StvyEntityPhoto *photo = [[product.photos allObjects] firstObject];
    expect(photo).to.beInstanceOf(StvyEntityPhoto.class);
    expect(photo.homepage.path.length).to.beGreaterThanOrEqualTo(10);
}

@end
