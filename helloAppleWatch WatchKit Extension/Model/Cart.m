//
//  Cart.m
//  helloAppleWatch
//
//  Created by Jhonathan Wyterlin on 23/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "Cart.h"

@implementation Cart

static Cart *singleton = nil;

+(Cart *)singletonInstance {
    
    if ( singleton == nil )
        singleton = [Cart new];
    
    return singleton;
    
}

@end
