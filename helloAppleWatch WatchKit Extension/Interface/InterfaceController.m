//
//  InterfaceController.m
//  helloAppleWatch WatchKit Extension
//
//  Created by Jhonathan Wyterlin on 04/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (instancetype)init {
    
    self = [super init];
    
    if ( self ) {
    }
    
    return self;
    
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    [WKInterfaceController reloadRootControllersWithNames:@[] contexts:@[]];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



