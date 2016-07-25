//
//  ViewController.m
//  ViewControllerLifecircleDemo
//
//  Created by wangqinglu on 16/7/25.
//  Copyright © 2016年 xs. All rights reserved.
//

#import "ViewController.h"
#import "XSDViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIWindow *window2;
@property (weak, nonatomic) IBOutlet UIView *aSubView;

@end

@implementation ViewController

- (void)viewDidLoad {
    NSLog(@"%s, %d, obj=%@", __func__, __LINE__, self);
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    NSLog(@"aSubView.frame = %@", NSStringFromCGRect(self.aSubView.frame));
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

- (void)viewWillLayoutSubviews {
    NSLog(@"%s, %d, obj = %@", __func__, __LINE__, self);
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    NSLog(@"aSubView.frame = %@", NSStringFromCGRect(self.aSubView.frame));
}

- (void)viewDidLayoutSubviews {
    NSLog(@"%s, %d, obj = %@", __func__, __LINE__, self);
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    NSLog(@"aSubView.frame = %@", NSStringFromCGRect(self.aSubView.frame));
}

- (void)updateViewConstraints {
    NSLog(@"%s, %d, obj = %@", __func__, __LINE__, self);
    [super updateViewConstraints];
    
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    NSLog(@"aSubView.frame = %@", NSStringFromCGRect(self.aSubView.frame));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedButton:(id)sender {
    NSLog(@"==========推入子VC=========");
    ViewController *subVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:subVC animated:NO];
}

- (IBAction)pressedPresentButton:(id)sender {
    NSLog(@"==========弹出子VC=========");
    ViewController *subVC = [[ViewController alloc] init];
    [self presentViewController:subVC animated:YES completion:nil];
}

- (IBAction)pressedAddSubButton:(id)sender {
    NSLog(@"==========添加子VC的View=========");
    XSDViewController *subVC = [[XSDViewController alloc] init];
    [self addChildViewController:subVC];
    [subVC.view setFrame:self.view.frame];
    [self.view addSubview:subVC.view];
    [subVC didMoveToParentViewController:self];
//    [self.navigationController pushViewController:subVC animated:NO];
}

- (IBAction)pressedAddWindowButton:(id)sender {
    NSLog(@"==========添加Window=========");
    UIWindow *window2 = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window2.backgroundColor = [UIColor redColor];
    window2.windowLevel = UIWindowLevelAlert;
    self.window2 = window2;
    [window2 makeKeyAndVisible];
}
@end
