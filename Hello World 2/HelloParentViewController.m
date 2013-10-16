//
//  HelloParentViewController.m
//  Hello World 2
//
//  Created by Carmel on 10/16/13.
//  Copyright (c) 2013 Carmel. All rights reserved.
//

#import "HelloParentViewController.h"

@interface HelloParentViewController ()

//@synthesize main_tab, tabs_Array;

@end

@implementation HelloParentViewController

- (id)init
{
    self.main_tab = [[UITabBarController alloc ] init];
    self = [super init];
    if (self){

    }
    self.title = @"Parent Class";
    self.main_tab.viewControllers = self.tabs_Array;
    [self.view addSubview:self.main_tab.view];
    
    return self;
}


- (void)viewDidLoad
{

    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
