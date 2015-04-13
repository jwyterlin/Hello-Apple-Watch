//
//  PageOneInterfaceController.m
//  helloAppleWatch
//
//  Created by Jhonathan Wyterlin on 08/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "HomeInterfaceController.h"
#import "CategoryRowController.h"

@interface HomeInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;
@property (strong, nonatomic) NSArray *categories;

@end

@implementation HomeInterfaceController

-(void)awakeWithContext:(id)context {
 
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    [self setTitle:@"Names #01"];
    [self loadTableData];
    
}

-(void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

-(void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

-(void)loadTableData {
    
    self.categories = @[ @{@"name":@"Pizza",@"image":[UIImage imageNamed:@"pizza.png"]},
                         @{@"name":@"Hamburger",@"image":[UIImage imageNamed:@"hamburger.png"]},
                         @{@"name":@"Hot Dog",@"image":[UIImage imageNamed:@"hot_dog.png"]},
                         @{@"name":@"Drinks",@"image":[UIImage imageNamed:@"drink.png"]}
                        ];
    
    [self.table setNumberOfRows:self.categories.count withRowType:@"category"];
    
    [self.categories enumerateObjectsUsingBlock:^(NSDictionary *category, NSUInteger idx, BOOL *stop) {
    
        CategoryRowController *row = [self.table rowControllerAtIndex:idx];
        
        NSString *categoryName = category[@"name"];
        UIImage *categoryImage = category[@"image"];
        
        [row.categoryRowLabel setText:categoryName];
        [row.categoryRowImage setImage:categoryImage];
        
    }];
    
}

-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    
    NSLog( @"category selected: %@", self.categories[rowIndex] );
    
}

@end



