//
//  ViewController.h
//  helloAppleWatch
//
//  Created by Jhonathan Wyterlin on 04/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic,strong) IBOutlet UIButton *okButton;
@property(nonatomic,strong) IBOutlet UILabel *messageLabel;

-(IBAction)okButtonPressed:(id)sender;

@end

