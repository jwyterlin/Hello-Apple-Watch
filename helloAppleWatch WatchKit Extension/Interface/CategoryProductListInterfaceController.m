//
//  PageOneInterfaceController.m
//  helloAppleWatch
//
//  Created by Jhonathan Wyterlin on 08/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "CategoryProductListInterfaceController.h"
#import "CategoryProductRowController.h"

// Model
#import "ProductCategory.h"

@interface CategoryProductListInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;
@property (strong, nonatomic) NSArray *categories;

@end

@implementation CategoryProductListInterfaceController

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
    
    [self loadCategoriesList];
    
    [self.table setNumberOfRows:self.categories.count withRowType:@"categoryRow"];
    
    [self.categories enumerateObjectsUsingBlock:^(ProductCategory *category, NSUInteger idx, BOOL *stop) {
    
        CategoryProductRowController *row = [self.table rowControllerAtIndex:idx];
        
        [row.categoryRowLabel setText:category.name];
        [row.categoryRowImage setImage:category.image];
        
    }];
    
}

-(void)loadCategoriesList {
    
    ProductCategory *pizza = [ProductCategory new];
    pizza.name = @"Pizza";
    pizza.image = [UIImage imageNamed:@"pizza.png"];
    
    ProductCategory *hamburger = [ProductCategory new];
    hamburger.name = @"Hamburger";
    hamburger.image = [UIImage imageNamed:@"hamburger.png"];
    
    ProductCategory *hotDog = [ProductCategory new];
    hotDog.name = @"Hot Dog";
    hotDog.image = [UIImage imageNamed:@"hot_dog.png"];
    
    ProductCategory *drinks = [ProductCategory new];
    drinks.name = @"Drinks";
    drinks.image = [UIImage imageNamed:@"drink.png"];
    
    self.categories = @[ pizza,
                         hamburger,
                         hotDog,
                         drinks
                         ];
    
}

-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    
    NSLog( @"category selected: %@", self.categories[rowIndex] );
    
    ProductCategory *productCategory = self.categories[rowIndex];
    
    NSArray *controllerNames = @[@"productList", @"productList", @"productList", @"productList", @"productList"];
    NSArray *contexts = @[productCategory, productCategory, productCategory, productCategory, productCategory];
    
    [self presentControllerWithNames:controllerNames contexts:contexts];
    
}

@end



