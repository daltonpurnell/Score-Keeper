//
//  SKViewController.m
//  Score Keeper
//
//  Created by User on 4/1/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKViewController.h"


// Define margins so that nothing bumps into the edges
static CGFloat margin = 20;

// Define the height of the score view so that they don't overlap each other
static CGFloat HeightOfScoreView = 90;


@interface SKViewController () <UITextFieldDelegate>

// set steppper, text field, scrollview, and label as global properties here so they can be used in more than one method
@property (nonatomic, strong) UIScrollView *myScrollView;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UILabel *score;
@property (nonatomic, strong) UIStepper *stepper;

// Step 4: Store your scoreLabels. Create a mutable array property called scoreLabels
@property (nonatomic, strong) NSMutableArray *scoreLabels;

// Create an array property that holds views
//@property (nonatomic, strong) NSMutableArray *scoreViews;

@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    BackgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blurrybackground.png"]];
//    [self.view addSubview:BackgroundImage];
//    [BackgroundImage.superview sendSubviewToBack:BackgroundImage];
    
    // Add a scrollView property to your class
    UIScrollView *myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    // Set the title of the view controller "Score Keeper"
    self.title = @"Score Keeper";
    
    // Initialize the scrollView and add it to the main view of SKViewController
        [self.view addSubview:myScrollView];
        self.myScrollView = myScrollView;
    
    for (NSInteger i = 0; i < 4; i++) {
        [self addScoreView:i];
    }
    
    
}

- (void)addScoreView:(NSInteger)index{
    
    // Set variables for width of tex field, stepper, and score in order to lay them out beside each other
    CGFloat widthOfTextField = 100;
    CGFloat widthOfScore = 50;
    CGFloat widthOfStepper = 100;
    
    // Initialize a UIView called view
    // Lay them out by setting their frames in the new view
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, index * HeightOfScoreView, self.view.frame.size.width, HeightOfScoreView)];
    [self.myScrollView addSubview:view];
    
    // Initialize a UITextField for name
    // Lay them out by setting their frames in the new view
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(margin, margin, widthOfTextField, 50)];
    
    name.tag = -1000;
    
    // Set self as the delegate of the nameTextField.
    name.delegate = self;
    
    // Set placeholder text for text field
    name.placeholder = @"Name";
    name.font = [UIFont italicSystemFontOfSize:20];
    
    [view addSubview:name];
    
    // Initialize a UILabel for score
    // Lay them out by setting their frames in the new view
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(margin + widthOfTextField, margin, widthOfScore, 50)];
    score.text = @"0";
    score.font = [UIFont systemFontOfSize:30];
    score.textColor = [UIColor grayColor];
    score.textAlignment = NSTextAlignmentCenter;
    
    // In the addScoreView method add score to your scoreLabels array
    [self.scoreLabels addObject:score];
    [view addSubview:score];
    
    
    // Initialize a UIStepper for a button
    // Lay them out by setting their frames in the new view
    UIStepper *stepper = [[UIStepper alloc] initWithFrame:CGRectMake(50 + widthOfTextField + widthOfScore, 30, widthOfStepper, 50)];
    
    // Adjust minimum and maximum value properties for stepper
    stepper.maximumValue = 1000;
    stepper.minimumValue = -1000;
    
    // In the addScoreView method set the tag property of your stepper to the index you passed in
    stepper.tag = index;
    
    // Event
    [stepper addTarget:self action:@selector(stepperChanged:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:stepper];
    
    
    
    
    
    [self.myScrollView addSubview:view];
    


    
    // Store your scoreView in the array at the end of the addScoreView method
//    [self.scoreViews addObject:view];
    
    
}

// Action
-(void)stepperChanged:(id)sender
{
  
// In the IBAction method capture the value of the stepper
    UIStepper *stepper = sender;
    NSInteger index = stepper.tag;
    double value = [stepper value];
    
// Get the label from the array of labels that is at the index matching the tag of stepper
    self.score = self.scoreLabels[index];
    
// Update the text of the label to match the value of the stepper
    self.score.text = [NSString stringWithFormat:@"%d", (int)value];
}

// Step 5: Dismiss the keyboard when done editing name.
// Add a textFieldShouldReturn delegate method

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // Have the textField resign firstResponder
    [textField resignFirstResponder];
    
    return YES;
}


//- (void)removeLastScore {
//    [self.scoreViews removeObject:view];
//    
//}

@end
