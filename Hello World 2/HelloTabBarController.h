//
//  HelloTabBarController.h
//  Hello World 2
//
//  Created by Carmel on 10/16/13.
//  Copyright (c) 2013 Carmel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelloViewController.h"

@interface HelloTabBarController : UIViewController

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic, retain) UIViewController *viewController1;
@property (nonatomic, retain) UIViewController *viewController2;
@property (nonatomic, retain) UITabBarController *main_tab;
@property (nonatomic, retain) NSArray *tabs_array;

@end
