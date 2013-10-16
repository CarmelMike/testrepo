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
    self.startingYCoordinate = 60; //sets the starting Y coordinates for the text field, slider, and buttons
    self.numberOfButtons = 2;      //sets the initial number of buttons displayed on the screen to 2
    self.sliderValue = 2;          //sets default slider value to 2
    self.fullNumber = @"";         //fullNumber is used with the textField delegate. The delegate will create a string of the numbers inputted to the text box and convert them to an int
    NSLog(@"start init: %i", self.numberOfButtons);
    self = [super init];
    if (self) {
        self.buttonArray = [self createButtonArrayWithSize:5];
        self.numberField = [self createTextField:30];
        self.sliderBar = [self createSlider:80];
    }

    return self;
}


//Creates sliders bar. Make also be created dynamically

- (UISlider*) createSlider:(NSInteger) yOrigin
{
    CGRect frame = CGRectMake(50, self.startingYCoordinate + yOrigin, 220.0, 10.0);
    self.sliderBar = [[UISlider alloc] initWithFrame:frame];
    [self.sliderBar setBackgroundColor:[UIColor clearColor]];
    self.sliderBar.minimumValue = 0.0;
    self.sliderBar.maximumValue = 4.0;
    self.sliderBar.value = 2;
    self.sliderBar.continuous = YES;
    [self.sliderBar addTarget:self
                       action:@selector(valueChanged:) //calls valueChanged function below
     forControlEvents:UIControlEventValueChanged];
    self.sliderValue = self.sliderBar.value;
    [self.view addSubview:self.sliderBar];
    
    return self.sliderBar;
}


//Function designed to change the number of buttons that appear on the screen in realtime as the user moves the slider.

-(void) valueChanged: (NSInteger) currentValueOfSilder
{
    
    self.numberOfButtons = self.sliderBar.value;
    [self clearButtonArray];
    [self setValuesForButtons];
    
}


//Method that is responsible for creating a text field. Can be dynamically used for multiple text fields.

- (UITextField*) createTextField:(NSInteger) yOrigin
{

    self.numberField = [[UITextField alloc] initWithFrame:CGRectMake(50, self.startingYCoordinate + yOrigin, 220, 40)];
    self.numberField.borderStyle = UITextBorderStyleRoundedRect;
    self.numberField.font = [UIFont systemFontOfSize:15];
    self.numberField.placeholder = @"Enter number of buttons";
    self.numberField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.numberField.keyboardType = UIKeyboardTypeNumberPad;
    self.numberField.returnKeyType = UIReturnKeyDone;
    self.numberField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.numberField.delegate = self;
    NSLog(@"createTextField: %i", self.numberOfButtons);
    [self.view addSubview:self.numberField];
    return self.numberField;
}
    

//Handles the closing on the keyboard when the user touches/clicks the screen.

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    [self.numberField resignFirstResponder];
    [self.sliderBar resignFirstResponder];
    NSLog(@"in touchesEnded: %i", self.numberOfButtons);

}

- (IBAction)backgroundTap:(id)sender {

    [self.numberField resignFirstResponder];
    [self.sliderBar resignFirstResponder];
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
    if (self.numberOfButtons >= 5){
        self.numberOfButtons = 5;
    }
    if (self.numberOfButtons <= 0){
        self.numberOfButtons = 0;
    }
    
    int yAdjustment = self.startingYCoordinate + 30;
    for (int i = 0; i < self.numberOfButtons; i++) {
        int y = (i + 1) * 100 + yAdjustment;
        self.buttonArray[i] = [self setButton:self.buttonArray[i] WithFrame:CGRectMake(50, y, 220, 75) color:[UIColor redColor] title:@"Paint It Black"];
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
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

    self.fullNumber = [self.fullNumber stringByReplacingCharactersInRange:range withString:string];
    
    self.numberOfButtons = [self.fullNumber integerValue];
    //[self.numberField resignFirstResponder];
    [self clearButtonArray];
    [self setValuesForButtons];
    //NSLog(@"Length of string: %lu ",(unsigned long)len);
    NSLog(@"The number currently is: %@", self.fullNumber);
    //NSLog(@"Character: %c ",c);
    
     return 1;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
