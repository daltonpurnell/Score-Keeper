//
//  SKViewController.m
//  Score Keeper
//
//  Created by User on 4/1/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKViewController.h"

static CGFloat margin = 20;
static CGFloat HeightOfScoreView = 90;


@interface SKViewController ()

@property (nonatomic, strong) UIScrollView *myScrollView;
@property (nonatomic, strong) UIStepper *stepper;
@property (nonatomic, strong) UITextField *name;
@property (nonatomic, strong) UILabel *score;
@property (nonatomic, strong) NSMutableArray *scoreLabels; // Don't understand what this is doing


@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Add a scrollView property to your class
    UIScrollView *myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    // Set the title of the view controller "Score Keeper"
    self.title = @"Score Keeper";
    
    // Initialize the scrollView and add it to the main view of SKViewController
        [self.view addSubview:myScrollView];
    self.myScrollView = myScrollView;
    
    }
}

- (void)addScoreView:(NSInteger)index{
    
    CGFloat widthOfTextField = 100;
    CGFloat widthOfScore = 50;
    CGFloat widthOfStepper = 100;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, HeightOfScoreView, self.view.frame.size.width, HeightOfScoreView)];
    [self.myScrollView addSubview:view];
    
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(margin, margin, widthOfTextField, 50)];
    name.placeholder = @"Name";
    
    [view addSubview:name];
    
    
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + widthOfTextField, self.view.frame.origin.y, widthOfScore, 50)];
    score.text = @"0";
    score.textAlignment = NSTextAlignmentCenter;
    
    [self.scoreLabels addObject:score];  // don't understand this line
    [view addSubview:score];
    
    UIStepper *stepper = [[UIStepper alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + widthOfTextField + widthOfScore, margin, widthOfStepper, 50)];
    stepper.maximumValue = 1000;
    stepper.minimumValue = 0;
    [view addSubview:stepper];
    
    [self.myScrollView addSubview:view];
    
    
    // Event
    [stepper addTarget:self action:@selector(stepperChanged:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)stepperChanged:(id)sender {
    
}

@end
