//
//  ViewController.h
//  WhiteBoxApp
//
//  Created by Develop on 05.06.16.
//  Copyright © 2016 antonpetrovmak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *rowLabel;
@property (weak, nonatomic) IBOutlet UILabel *columnLabel;
@property (weak, nonatomic) IBOutlet UITextView *outputTextView;

@property (weak, nonatomic) IBOutlet UIStepper *rowStepper;
@property (weak, nonatomic) IBOutlet UIStepper *columnStepper;

- (IBAction)actionChangeValue:(UIStepper *)sender;
- (IBAction)actionEnter:(id)sender;
@end

