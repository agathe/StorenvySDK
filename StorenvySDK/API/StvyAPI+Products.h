//
// Created by Agathe Battestini on 2/19/14.
// Copyright (c) 2014 Storenvy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StvyAPI.h"

@interface StvyAPI (Products)

- (RACSignal *)loadProducts;

@end