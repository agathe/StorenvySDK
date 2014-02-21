//
//  StvyPublicMappingTest.h
//  StvySDK
//

#import "StvyTest.h"
#import <RestKit/RestKit.h>

@interface StvyPublicMappingTest : StvyTest

- (NSDictionary *)mappingData:(NSString *)type;
- (id)mappingForClass:(id)thing;
- (RKMappingTest *)testForMapping:(RKObjectMapping *)mapping withData:(id)data;

@end
