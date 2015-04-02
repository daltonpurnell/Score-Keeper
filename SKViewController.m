//
//  SKViewController.m
//  Score Keeper
//
//  Created by User on 4/1/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKViewController.h"

@interface SKViewController ()

@property (nonatomic) UIScrollView *myScrollView;
@property (nonatomic) UIStepper *stepper;
@property (nonatomic) UITextField *name;
@property (nonatomic) UILabel *score;

@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Add a scrollView property to your class
    UIScrollView *myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    
    // Set the title of the view controller "Score Keeper"
    self.title = @"Score Keeper";
    
    // Initialize the scrollView and add it to the main view of scoreViewController
        [self.view addSubview:myScrollView];
    
    
}

- (void)addScoreView:(int)index{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    [self.myScrollView addSubview:view];
    
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, 200, 50)];
    name.placeholder = @"Name";
    
    [self.myScrollView addSubview:name];
    
    
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.origin.x * 2, self.view.frame.origin.y, 50, 50)];
    [self.myScrollView addSubview:score];
    
    UIStepper *stepper = [[UIStepper alloc] initWithFrame:CGRectMake(self.view.frame.origin.x * 3, self.view.frame.origin.y, 100, 50)];
    stepper.maximumValue = 100;
    stepper.minimumValue = 0;
    [self.myScrollView addSubview:stepper];
    
    // Event
    [stepper addTarget:self action:@selector(stepperTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)stepperTapped:(id)sender {
    
}

@end
