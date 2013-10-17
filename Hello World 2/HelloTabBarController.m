//
//  HelloTabBarController.m
//  Hello World 2
//
//  Created by Carmel on 10/16/13.
//  Copyright (c) 2013 Carmel. All rights reserved.
//

#import "HelloTabBarController.h"


@interface HelloTabBarController ()

@end

@implementation HelloTabBarController
//@synthesize viewController1, viewController2, main_tab, tabs_array;

- (id) init{

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    
    [self createTabBar];
  //  [self callFirstView];
    
    return self;
}

- (void) createTabBar
{
    
    
    self.main_tab = [[UITabBarController alloc] init];
    
    HelloViewController* firstViewController = [[HelloViewController alloc] init];
    
    //self.viewController1 = [[UIViewController alloc] init];
    firstViewController.title = @"View 1";
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    
    self.viewController2 = [[UIViewController alloc] init];
    self.viewController2.title = @"View 2";
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:self.viewController2];
    
    
    
    UIImage* tabBarBackground = [UIImage imageNamed:@"T-rex_wiki_logo.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];

    
    
    //self.tabs_array = [[NSArray alloc] initWithObjects:nav1, nil];
    self.tabs_array = [[NSArray alloc] initWithObjects:nav1, nav2, nil];
    self.main_tab.viewControllers = self.tabs_array;
    
    
    [self.window addSubview:self.main_tab.view];
    [self.window makeKeyAndVisible];
    
    
}

- (void)callFirstView
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    HelloViewController* firstViewController = [[HelloViewController alloc] init];
    //HelloTabBarController* firstViewController = [[HelloTabBarController alloc] init];
    [self.window setRootViewController:firstViewController];
    
    
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
