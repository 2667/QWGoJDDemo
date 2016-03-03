//
//  ViewController.m
//  SizeToFit
//
//  Created by zmit on 15/5/22.
//  Copyright (c) 2015年 zmit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(60, 50, 200, 40)];
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"使用SizeToFit" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //textField
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(60, 100, 200, 30)];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTextField) name:UITextFieldTextDidChangeNotification object:nil];
    _textField.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_textField];
    
    //label
    _label = [[UILabel alloc] initWithFrame:CGRectMake(60, 150, 40, 20)];
    _label.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_label];
}

- (void)btnEvent
{
    [_label sizeToFit];
}

- (void)changeTextField
{
    _label.text = _textField.text;
}

@end