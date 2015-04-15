//
//  PageThreeInterfaceController.m
//  helloAppleWatch
//
//  Created by Jhonathan Wyterlin on 08/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "PageThreeInterfaceController.h"

@interface PageThreeInterfaceController ()

@end

@implementation PageThreeInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    [self setTitle:@"Names #03"];
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



