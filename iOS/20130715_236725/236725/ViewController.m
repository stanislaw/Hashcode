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

    // Подписываемся на события клавиатуры
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(keyboardWillShowNotification:)
               name:UIKeyboardWillShowNotification
             object:nil];

    [nc addObserver:self
           selector:@selector(keyboardDidShowNotification:)
               name:UIKeyboardDidShowNotification
             object:nil];
    
    [nc addObserver:self
           selector:@selector(keyboardWillHideNotification:)
               name:UIKeyboardWillHideNotification
             object:nil];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:screenFrame()];
    self.scrollView.scrollEnabled = YES;
    self.scrollView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    
    [self.view addSubview:self.scrollView];

    UITextField *textField;

    textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 30)];
    textField.backgroundColor = [UIColor grayColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Enter the text 1";
    textField.delegate = self;

    [self.scrollView addSubview:textField];

    textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 400, CGRectGetWidth(self.view.frame), 30)];
    textField.backgroundColor = [UIColor grayColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Enter the text 2";
    textField.delegate = self;

    [self.scrollView addSubview:textField];

    textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 800, CGRectGetWidth(self.view.frame), 30)];
    textField.backgroundColor = [UIColor grayColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Enter the text 3";
    textField.delegate = self;

    [self.scrollView addSubview:textField];

    // Чисто фиктивный лабел, который изображает область до которой вы хотите иметь возможность доскролливать в Вашем реальном приложении
    UILabel *bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 900, CGRectGetWidth(self.view.frame), 100)];
    bottomLabel.backgroundColor = [UIColor redColor];
    bottomLabel.text = @"ПОДВАЛ";

    [self.scrollView addSubview:bottomLabel];

    // Выставляем размер области скролла по низу подвала
    self.scrollView.contentSize = (CGSize){0, CGRectGetMaxY(bottomLabel.frame)}; 
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    // Свойство "текущее поле" нужно для того, чтобы работать с текущем поле в клавиатурных событиях-нотификациях
    self.currentTextField = textField;

}

-(void)keyboardWillShowNotification:(NSNotification *)aNotification {

}

-(void)keyboardDidShowNotification:(NSNotification *)aNotification {
    CGRect keyboardScreenRect = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];

    CGSize contentSize = self.scrollView.contentSize;
    contentSize.height += CGRectGetHeight(keyboardScreenRect);
    self.scrollView.contentSize = contentSize;

    [self.scrollView setContentOffset:(CGPoint){
        0,
        fminf(CGRectGetMinY(self.currentTextField.frame), self.scrollView.contentSize.height - CGRectGetHeight(self.scrollView.frame))
    } animated:NO];
}

-(void)keyboardWillHideNotification:(NSNotification *)aNotification {
    CGRect keyboardScreenRect = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];

    CGSize contentSize = self.scrollView.contentSize;
    contentSize.height -= CGRectGetHeight(keyboardScreenRect);
    self.scrollView.contentSize = contentSize;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.currentTextField = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];

    return YES;
}

@end
