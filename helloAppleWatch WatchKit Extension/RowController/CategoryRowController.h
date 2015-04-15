//
//  CategoryRowController.h
//  helloAppleWatch
//
//  Created by Jhonathan Wyterlin on 11/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <WatchKit/WatchKit.h>

@interface CategoryRowController : NSObject

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *categoryRowLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *categoryRowImage;

@end
