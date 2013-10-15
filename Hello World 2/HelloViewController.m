//
//  HelloViewController.m
//  Hello World 2
//
//  Created by Carmel on 10/15/13.
//  Copyright (c) 2013 Carmel. All rights reserved.
//
// THIS IS SOME TEST CODE.... test

#import "HelloViewController.h"

@interface HelloViewController ()

@end

@implementation HelloViewController


- (id)init
{
    self.numberOfButtons = 100;
    NSLog(@"start init: %i", self.numberOfButtons);
    self = [super init];
    if (self) {
        self.buttonArray = [self createButtonArrayWithSize:self.numberOfButtons];
        NSLog(@"end init: %i", self.numberOfButtons);
        self.numberField = [self createTextField:30];
        NSLog(@"end init2: %i", self.numberOfButtons);
    }

    return self;
}

- (UITextField*) createTextField:(NSInteger) yOrigin
{
  //  UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, yOrigin, 220, 40)];
    self.numberField = [[UITextField alloc] initWithFrame:CGRectMake(50, yOrigin, 220, 40)];
    self.numberField.borderStyle = UITextBorderStyleRoundedRect;
    self.numberField.font = [UIFont systemFontOfSize:15];
    self.numberField.placeholder = @"Enter number of buttons";
    self.numberField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.numberField.keyboardType = UIKeyboardTypeNumberPad;
    self.numberField.returnKeyType = UIReturnKeyDone;
    self.numberField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    //self.numberOfButtons = [self.numberField.text integerValue];
    NSLog(@"createTextField: %i", self.numberOfButtons);
    [self.view addSubview:self.numberField];
    // [textField release];
    return self.numberField;
}
    

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.numberOfButtons = [self.numberField.text integerValue];
    [self.numberField resignFirstResponder];
    [self clearButtonArray];
    [self setValuesForButtons];
   // self.buttonArray = [self createButtonArrayWithSize:self.numberOfButtons];
    //NSString *digit = [[sender titlelabel] text];
    NSLog(@"in touchesEnded: %i", self.numberOfButtons);
//    NSLog(@%@", digit);

}




- (IBAction)backgroundTap:(id)sender {

    [self.numberField resignFirstResponder];
}

- (void) clearButtonArray
{
    for (int i = 0; i < self.buttonArray.count; i++) {
        self.buttonArray[i] = [self setButton:self.buttonArray[i] WithFrame:CGRectMake(0, 0, 0, 0) color:[UIColor redColor] title:@""];
    }

}


- (NSMutableArray*) createButtonArrayWithSize:(NSInteger) size
{
    NSMutableArray *arrayOfButtons = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < size; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = i;
        [arrayOfButtons addObject:button];
    }
    
    return arrayOfButtons;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setValuesForButtons];
}

- (void)setValuesForButtons
{
    for (int i = 0; i < self.numberOfButtons; i++) {
        int y = (i + 1) * 100;
        self.buttonArray[i] = [self setButton:self.buttonArray[i] WithFrame:CGRectMake(50, y, 220, 75) color:[UIColor redColor] title:@"Paint It Black"];

        //saved if I want to go back to custom buttons with different text, etc
        /*
        switch (i) {
            case 0:
                self.buttonArray[0] = [self setButton:self.buttonArray[0] WithFrame:CGRectMake(40, 100, 250, 150) color:[UIColor redColor] title:@"Paint It Black"];
                break;
            case 1:
                self.buttonArray[1] = [self setButton:self.buttonArray[1] WithFrame:CGRectMake(40, 300, 250, 150) color:[UIColor redColor] title:@"Paint It Black"];
            default:
                break;
        }
         */
    }
}

- (UIButton*) setButton:(UIButton*)button WithFrame:(CGRect) frame color:(UIColor*) color title:(NSString*) title
{
    button.frame = frame;
    button.backgroundColor = color;
    [button setTitle:title forState:UIControlStateNormal];
    //self.coolButton.titleLabel.text = @"Make me black";
    [button addTarget:self
               action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
    return button;

}


- (void)buttonPressed: (UIButton*) button{

    UIButton *tempButton;
    //int tagNumber = button.tag;
    tempButton = (UIButton*)[self.buttonArray objectAtIndex:button.tag];
    if (tempButton.backgroundColor == [UIColor blackColor]){
        tempButton.backgroundColor = [UIColor redColor];
    }
    else if (tempButton.backgroundColor == [UIColor redColor]){
        tempButton.backgroundColor = [UIColor blackColor];
    }

    /*
    switch (button.tag) {
   
   
        case 0:
            tempButton = (UIButton*)[self.buttonArray objectAtIndex:0];
            if (tempButton.backgroundColor == [UIColor blackColor]){
                tempButton.backgroundColor = [UIColor redColor];
            }
            else if (tempButton.backgroundColor == [UIColor redColor]){
                tempButton.backgroundColor = [UIColor blackColor];
            }
            break;
        case 1:
            tempButton = (UIButton*)[self.buttonArray objectAtIndex:1];
            if (tempButton.backgroundColor == [UIColor blackColor]){
                tempButton.backgroundColor = [UIColor redColor];
            }
            else if (tempButton.backgroundColor == [UIColor redColor]){
                tempButton.backgroundColor = [UIColor blackColor];
            }
            
            
        default:
            break;
    }
*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
