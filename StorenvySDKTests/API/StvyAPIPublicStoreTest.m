//
//  StvyAPIPublicStoreTest.m
//  StvySDK
//
//

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <SenTestingKit/SenTestingKit.h>
#import "StvyPublicAPITest.h"
#import "StvyEntityPublicStore.h"


@interface StvyAPIPublicStoreTest : StvyPublicAPITest

@end

@implementation StvyAPIPublicStoreTest

- (void)testInitialization {
    NSString *baseUrl = @"http://lovejunkee.storenvy.com";
    expect(self.sdk).notTo.beNil();
    expect(self.api).notTo.beNil();
    expect(self.sdk.baseURL).to.equal(baseUrl);
}


- (void)testLoadStore
{
    StvyAPIResponse *response = nil;
    [self waitFor:self.api.loadStore result:&response];
    
    StvyEntityPublicStore *store = (StvyEntityPublicStore *)response.resultObject;
    
    expect(store).to.beInstanceOf(StvyEntityPublicStore.class);
    expect(store).notTo.beNil();
    expect(store.name).notTo.beNil();
    NSString *storeName = @"Love Junkee";
    expect(store.name).to.equal(storeName);
    
    [self waitFor:self.api.loadStore result:&response];
    [self waitFor:self.api.loadStore result:&response];
    [self waitFor:self.api.loadStore result:&response];
    [self waitFor:self.api.loadStore result:&response];
}

@end
