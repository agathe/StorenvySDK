#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "StvySDK.h"
#import "StvyPublicSDK.h"

SpecBegin(StvyPublicSDK )

describe(@"StvyPublicSDK", ^{
    it(@"should have the base url set", ^{
        StvyPublicSDK* sdk = [StvyPublicSDK sdkForStore:@"lovejunkee"];
        NSString *baseUrl = @"http://lovejunkee.storenvy.com";
        expect(sdk.baseURL).to.equal(baseUrl);

    });

    it(@"should have an API", ^{
        StvyPublicSDK* sdk = [StvyPublicSDK sdkForStore:@"lovejunkee"];
        expect(sdk.api).notTo.beNil();
    });

    it(@"should have an object session", ^{
        StvyPublicSDK* sdk = [StvyPublicSDK sdkForStore:@"lovejunkee"];
        expect(sdk.session).notTo.beNil();
        NSString *baseUrl = @"http://lovejunkee.storenvy.com";
        expect(sdk.session.baseURL).to.equal(baseUrl);
    });

    it(@"should have a manager", ^{
        StvyPublicSDK* sdk = [StvyPublicSDK sdkForStore:@"lovejunkee"];
        expect(sdk.manager).notTo.beNil();
        NSString *baseUrl = @"http://lovejunkee.storenvy.com";
        expect(sdk.manager.baseURL).to.equal(baseUrl);
    });

    it(@"should have the descriptors set", ^{
        StvyPublicSDK* sdk = [StvyPublicSDK sdkForStore:@"lovejunkee"];
//        expect(sdk.manager.baseURL).to.equal(baseUrl);
    });


});

SpecEnd