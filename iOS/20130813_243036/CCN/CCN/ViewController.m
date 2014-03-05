//
//  ViewController.m
//  CCN
//
//  Created by Ruslan on 25.07.13.
//  Copyright (c) 2013 Ruslan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize scroller;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [scroller setScrollEnabled:YES];

    [scroller setContentSize:CGSizeMake(320, 720)];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
