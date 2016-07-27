//
//  XSDViewController.m
//  ViewControllerLifecircleDemo
//
//  Created by streamstone on 16/7/25.
//  Copyright © 2016年 xs. All rights reserved.
//

#import "XSDViewController.h"

@interface XSDViewController ()
@property(nonatomic, strong) UIButton *button;
@end

@implementation XSDViewController
-(void)dealloc {
    NSLog(@"%s, %d, obj=%@", __func__, __LINE__, self);
}

- (void)viewDidLoad {
    NSLog(@"%s, %d, obj=%@", __func__, __LINE__, self);
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0, 300.0, 300.0, 44.0)];
    [backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(pressedBackButton:) forControlEvents:UIControlEventTouchUpInside];
    self.button = backButton;
    [self.view addSubview:backButton];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s, %d, obj=%@", __func__, __LINE__, self);
    NSLog(@"animated = %@", animated ? @"Yes" : @"No");
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%s, %d, obj=%@", __func__, __LINE__, self);
    NSLog(@"animated = %@", animated ? @"Yes" : @"No");
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"%s, %d, obj=%@", __func__, __LINE__, self);
    NSLog(@"animated = %@", animated ? @"Yes" : @"No");
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%s, %d, obj = %@", __func__, __LINE__, self);
    NSLog(@"animated = %@", animated ? @"Yes" : @"No");
    [super viewDidDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

#pragma mark - Action
- (void)pressedBackButton:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.view removeFromSuperview];
}

@end
