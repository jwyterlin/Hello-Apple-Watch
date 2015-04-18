//
//  ProductListInterfaceController.h
//  helloAppleWatch
//
//  Created by Jhonathan Wyterlin on 4/16/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface ProductListInterfaceController : WKInterfaceController

@property(nonatomic,strong) IBOutlet WKInterfaceLabel *label;
@property(nonatomic,strong) IBOutlet WKInterfaceImage *image;
@property(nonatomic,strong) IBOutlet WKInterfaceButton *addToCartButton;

@end
