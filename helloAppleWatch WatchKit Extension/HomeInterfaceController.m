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
@property (strong, nonatomic) NSArray *categoryNames;

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
    
    self.categoryNames = @[@"Pizza", @"Hamburguer", @"Hot Dog", @"Drinks"];
    
    [self.table setNumberOfRows:self.categoryNames.count withRowType:@"category"];
    
    [self.categoryNames enumerateObjectsUsingBlock:^(NSString *categoryName, NSUInteger idx, BOOL *stop) {
    
        CategoryRowController *row = [self.table rowControllerAtIndex:idx];
        
        [row.categoryRowLabel setText:categoryName];
        
    }];
    
}

-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    
    NSLog( @"category selected: %@", self.categoryNames[rowIndex] );
    
}

@end



