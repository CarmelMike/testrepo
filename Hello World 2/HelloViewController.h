//
//  HelloViewController.h
//  Hello World 2
//
//  Created by Carmel on 10/15/13.
//  Copyright (c) 2013 Carmel. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface HelloViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic, retain) NSMutableArray *buttonArray;
@property(nonatomic) int numberOfButtons;
@property(nonatomic) NSString *fullNumber;
@property (nonatomic, retain) IBOutlet UISlider *sliderBar;
@property (nonatomic, retain) IBOutlet UITextField *numberField;
@property (nonatomic) int startingYCoordinate;
@property(nonatomic) int sliderValue;
- (IBAction)backgroundTap:(id)sender;


@end
