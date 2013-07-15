//
//  ViewController.h
//  236725
//
//  Created by Stanislaw Pankevich on 7/15/13.
//  Copyright (c) 2013 Stanislaw Pankevich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property UIScrollView *scrollView;
@property (weak, nonatomic) UITextField *currentTextField;

@end
