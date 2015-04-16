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
#import "Product.h"

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

-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    
    NSLog( @"category selected: %@", self.categories[rowIndex] );
    
    ProductCategory *productCategory = self.categories[rowIndex];
    
    NSArray *products = [productCategory.products allObjects];
    
    NSMutableArray *controllerNames = [NSMutableArray new];
    
    for ( int x = 0; x < products.count; x++ )
        [controllerNames addObject:@"productList"];

    NSArray *contexts = products;
    
    [self presentControllerWithNames:controllerNames contexts:contexts];
    
}

// These methods are just for represent data for didactic purposes

-(void)loadCategoriesList {
    
    ProductCategory *pizza = [self createPizzaCategory];
    ProductCategory *hamburger = [self createHamburgerCategory];
    ProductCategory *hotDog = [self createHotDogCategory];
    ProductCategory *drinks = [self createDrinkCategory];
    
    self.categories = @[ pizza,
                         hamburger,
                         hotDog,
                         drinks
                         ];
    
}

-(ProductCategory *)createPizzaCategory {
    
    // Category
    ProductCategory *pizza = [ProductCategory new];
    pizza.name = @"Pizza";
    pizza.image = [UIImage imageNamed:@"pizza.png"];
    
    // Products of the category
    Product *marguerita = [Product new];
    marguerita.name = @"Marguerita";
    marguerita.image = [UIImage imageNamed:@"pizza.png"];
    
    Product *pepperoni = [Product new];
    pepperoni.name = @"Pepperoni";
    pepperoni.image = [UIImage imageNamed:@"pizza.png"];
    
    Product *sausage = [Product new];
    sausage.name = @"Sausage";
    sausage.image = [UIImage imageNamed:@"pizza.png"];
    
    NSSet *pizzas = [[NSSet alloc] initWithObjects:marguerita,pepperoni,sausage, nil];
    
    pizza.products = pizzas;
    
    return pizza;
    
}

-(ProductCategory *)createHamburgerCategory {
    
    // Category
    ProductCategory *hamburger = [ProductCategory new];
    hamburger.name = @"Hamburger";
    hamburger.image = [UIImage imageNamed:@"hamburger.png"];
    
    // Products of the category
    Product *cheeseburger = [Product new];
    cheeseburger.name = @"Cheeseburger";
    cheeseburger.image = [UIImage imageNamed:@"hamburger.png"];
    
    Product *cheesebacon = [Product new];
    cheesebacon.name = @"Cheesebacon";
    cheesebacon.image = [UIImage imageNamed:@"hamburger.png"];
    
    Product *fiestaBurger = [Product new];
    fiestaBurger.name = @"Fiesta burger";
    fiestaBurger.image = [UIImage imageNamed:@"hamburger.png"];
    
    Product *veganBBQ = [Product new];
    veganBBQ.name = @"Vegan BBQ";
    veganBBQ.image = [UIImage imageNamed:@"hamburger.png"];
    
    NSSet *hamburgers = [[NSSet alloc] initWithObjects:cheeseburger,cheesebacon,fiestaBurger, veganBBQ, nil];
    
    hamburger.products = hamburgers;
    
    return hamburger;
    
}

-(ProductCategory *)createHotDogCategory {
    
    // Category
    ProductCategory *hotDog = [ProductCategory new];
    hotDog.name = @"Hot Dog";
    hotDog.image = [UIImage imageNamed:@"hot_dog.png"];
    
    // Products of the category
    Product *classic = [Product new];
    classic.name = @"Classic";
    classic.image = [UIImage imageNamed:@"hot_dog.png"];
    
    Product *beefAndCheddar = [Product new];
    beefAndCheddar.name = @"Beef & Cheddar";
    beefAndCheddar.image = [UIImage imageNamed:@"hot_dog.png"];
    
    Product *baconDog = [Product new];
    baconDog.name = @"Bacon dog";
    baconDog.image = [UIImage imageNamed:@"hot_dog.png"];
    
    Product *jalapenoDog = [Product new];
    jalapenoDog.name = @"Jalapeno dog";
    jalapenoDog.image = [UIImage imageNamed:@"hot_dog.png"];
    
    NSSet *hotdogs = [[NSSet alloc] initWithObjects:classic,beefAndCheddar,baconDog,jalapenoDog, nil];
    
    hotDog.products = hotdogs;
    
    return hotDog;
    
}

-(ProductCategory *)createDrinkCategory {
    
    // Category
    ProductCategory *drink = [ProductCategory new];
    drink.name = @"Drinks";
    drink.image = [UIImage imageNamed:@"drink.png"];
    
    // Products of the category
    Product *coke = [Product new];
    coke.name = @"Coke";
    coke.image = [UIImage imageNamed:@"drink.png"];
    
    Product *sprite = [Product new];
    sprite.name = @"Sprite";
    sprite.image = [UIImage imageNamed:@"drink.png"];
    
    Product *fanta = [Product new];
    fanta.name = @"Fanta";
    fanta.image = [UIImage imageNamed:@"drink.png"];
    
    NSSet *drinks = [[NSSet alloc] initWithObjects:coke,sprite,fanta, nil];
    
    drink.products = drinks;
    
    return drink;
    
}

@end



