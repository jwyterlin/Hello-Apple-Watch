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
    [self setTitle:@"Food"];
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
    
    NSDictionary *pizza = [[NSDictionary alloc] initWithObjectsAndKeys:@"Pizza",@"name",[UIImage imageNamed:@"pizza.png"],@"image",nil];
    NSDictionary *hamburger = [[NSDictionary alloc] initWithObjectsAndKeys:@"Hamburger",@"name",[UIImage imageNamed:@"hamburger.png"],@"image", nil];
    NSDictionary *hotDog = [[NSDictionary alloc] initWithObjectsAndKeys:@"Hot Dog",@"name",[UIImage imageNamed:@"hot_dog.png"], @"image", nil];
    NSDictionary *drinks = [[NSDictionary alloc] initWithObjectsAndKeys:@"Drinks",@"name",[UIImage imageNamed:@"drink.png"], @"image", nil];
    
    self.categories = @[ pizza,
                         hamburger,
                         hotDog,
                         drinks
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



