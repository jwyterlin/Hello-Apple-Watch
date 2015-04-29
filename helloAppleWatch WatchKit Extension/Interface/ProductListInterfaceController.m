//
//  ProductListInterfaceController.m
//  helloAppleWatch
//
//  Created by Jhonathan Wyterlin on 4/16/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "ProductListInterfaceController.h"

// Model
#import "Product.h"

@interface ProductListInterfaceController ()

@property(nonatomic,strong) Product *product;

@end

@implementation ProductListInterfaceController

-(void)awakeWithContext:(id)context {
 
    [super awakeWithContext:context];

    // Configure interface objects here.
    Product *product = (Product *)context;
    [self.label setText:product.name];
    [self.image setImage:product.image];
    
    self.product = product;

}

-(void)willActivate {
 
    // This method is called when watch view controller is about to be visible to user
    
    [super willActivate];
    
}

-(void)didDeactivate {
 
    // This method is called when watch view controller is no longer visible
    
    [super didDeactivate];
    
}

-(IBAction)addToCart:(id)sender {
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:self.product.name,@"product", nil];
    
    [WKInterfaceController openParentApplication:dictionary reply:^(NSDictionary *replyInfo, NSError *error) {
       
        if ( replyInfo ) {
            
            if ( replyInfo[@"Some data"] ) {
                
                NSString *stringResult = replyInfo[@"Some data"];
                
                NSLog(@"stringResult: %@", stringResult);
                
                return;
                
            } else {
                
                NSLog(@"No Some data");
                
            }
            
        }
            
        if ( error ) {
            NSLog(@"Error occurred: %@", error);
        } else {
            NSLog(@"No error, but no data either");
        }
        
    }];
    
}

@end



