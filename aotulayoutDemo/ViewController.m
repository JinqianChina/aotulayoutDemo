//
//  ViewController.m
//  aotulayoutDemo
//
//  Created by 郭进 on 16/4/8.
//  Copyright © 2016年 郭进前. All rights reserved.
//

#import "ViewController.h"
#import "aotulayoutViewController.h"
#import "AutoLayoutVCWithXibViewController.h"
#import "AotulayoutVFLViewController.h"
#import "AotulayoutMasonryViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"aotulayoutDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"aotulayoutDemo系统手码" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 200, 50)];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"aotulayoutDemoXib可视化" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, 200, 50)];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 setTitle:@"aotulayoutDemoVFL可视化" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(50, 400, 200, 50)];
    btn3.backgroundColor = [UIColor redColor];
    [btn3 setTitle:@"aotulayoutDemoMasonry链式语言" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
}

- (void)btnClick
{
    aotulayoutViewController *VC = [[aotulayoutViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)btn1Click
{
    AutoLayoutVCWithXibViewController *vc = [[AutoLayoutVCWithXibViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)btn2Click
{
    AotulayoutVFLViewController *vc = [[AotulayoutVFLViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)btn3Click
{
    AotulayoutMasonryViewController *vc = [[AotulayoutMasonryViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
