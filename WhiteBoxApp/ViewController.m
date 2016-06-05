//
//  ViewController.m
//  WhiteBoxApp
//
//  Created by Develop on 05.06.16.
//  Copyright © 2016 antonpetrovmak. All rights reserved.
//

#import "ViewController.h"
#import "PVAlgebraMatrix.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma makr - Actions

- (IBAction)actionChangeValue:(UIStepper *)sender {
    if(sender.tag) {
        self.columnLabel.text = [NSString stringWithFormat:@"%.0f", self.columnStepper.value];
    } else {
        self.rowLabel.text = [NSString stringWithFormat:@"%.0f", self.rowStepper.value];
    }
}

- (IBAction)actionEnter:(id)sender {
    PVAlgebraMatrix *matrix = [[PVAlgebraMatrix alloc] initWithRows:self.rowStepper.value
                                                            columns:self.columnStepper.value
                                      setDefaultValueForAllElements:0];
    
    for (int i = 1; i <= matrix.numberOfRows; i++) {
        for (int j = 1; j <= matrix.numberOfColumns; j++) {
            [matrix replaceElementAtRow:i column:j withElement: [NSNumber numberWithInt: arc4random_uniform(100) - 50]];
        }
    }
    
 
    int maxSum = INT_MIN;
    int sumInCurrentRow = 0;
    int rowWithMaxSum = 0;
    for (int i = 1; i <= matrix.numberOfRows; i++) {
        sumInCurrentRow = 0;
        for (int j = 1; j <= matrix.numberOfColumns; j++) {
            sumInCurrentRow += [[matrix elementAtRow:i column:j] intValue];
        }
        if(sumInCurrentRow > maxSum) {
            maxSum = sumInCurrentRow;
            rowWithMaxSum = i;
        }
    }
    
    NSString *str = @"";
    for (int j = 1; j <= matrix.numberOfColumns; j++) {
        str = [NSString stringWithFormat:@"%@ %@",str, [[matrix elementAtRow:rowWithMaxSum column:j] stringValue]];
    }
    
    self.outputTextView.text = [NSString stringWithFormat:@"%@ \n\nСтрока с максимальной сумой (%d): \n(%@ )",
                                matrix, maxSum, str];
}
@end
