//
//  ViewController.m
//  236725
//
//  Created by Stanislaw Pankevich on 7/15/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import "ViewController.h"

CGRect screenFrame() {
    CGRect screenFrame = [[UIScreen mainScreen] applicationFrame];

    screenFrame.origin = CGPointZero;

    if (UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation)) {
        CGFloat width = screenFrame.size.width;
        screenFrame.size.width = screenFrame.size.height;
        screenFrame.size.height = width;
    }

    return screenFrame;
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.scrollView = [[UIScrollView alloc] initWithFrame:screenFrame()];

    [self.view addSubview:self.scrollView];

    UITextField *textField;

    textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 30)];
    textField.backgroundColor = [UIColor grayColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Enter the text";
    textField.delegate = self;

    [self.scrollView addSubview:textField];

    textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 400, CGRectGetWidth(self.view.frame), 30)];
    textField.backgroundColor = [UIColor grayColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Enter the text";
    textField.delegate = self;

    [self.scrollView addSubview:textField];

    textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 700, CGRectGetWidth(self.view.frame), 30)];
    textField.backgroundColor = [UIColor grayColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Enter the text";
    textField.delegate = self;

    [self.scrollView addSubview:textField];

    self.scrollView.contentSize = (CGSize){0, CGRectGetMaxY(textField.frame)};
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.scrollView.contentOffset = (CGPoint){
        0,
        CGRectGetMinY(textField.frame)
    };
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.scrollView.contentOffset = CGPointZero;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];

    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
