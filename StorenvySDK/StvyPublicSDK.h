//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StvySDK.h"

@interface StvyPublicSDK : StvySDK


+ (StvyPublicSDK*)sdkForStore:(NSString *)store;

- (id)initWithStoreName:(NSString *)storeName;

@end