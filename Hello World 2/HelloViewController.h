//
//  HelloViewController.h
//  Hello World 2
//
//  Created by Carmel on 10/15/13.
//  Copyright (c) 2013 Carmel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloViewController : UIViewController

@property(nonatomic, retain) NSMutableArray *buttonArray;
//@property(nonatomic, retain) UITextField *createTextField;
@property(nonatomic) int numberOfButtons;

@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UITextField *numberField;
//- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;


@end
