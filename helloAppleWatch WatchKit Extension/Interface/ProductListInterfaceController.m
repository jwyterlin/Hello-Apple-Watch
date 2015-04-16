//
//  ProductListInterfaceController.m
//  helloAppleWatch
//
//  Created by Jhonathan Wyterlin on 4/16/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "ProductListInterfaceController.h"

// Model
#import "ProductCategory.h"

@interface ProductListInterfaceController ()

@end

@implementation ProductListInterfaceController

-(void)awakeWithContext:(id)context {
 
    [super awakeWithContext:context];

    // Configure interface objects here.
    ProductCategory *productCategory = (ProductCategory *)context;
    [self.image setImage:productCategory.image];

}

-(void)willActivate {
 
    // This method is called when watch view controller is about to be visible to user
    
    [super willActivate];
    
}

-(void)didDeactivate {
 
    // This method is called when watch view controller is no longer visible
    
    [super didDeactivate];
    
}

@end



