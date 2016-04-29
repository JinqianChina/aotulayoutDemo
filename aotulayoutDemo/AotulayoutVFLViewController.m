//
//  AotulayoutVFLViewController.m
//  aotulayoutDemo
//
//  Created by 郭进 on 16/4/28.
//  Copyright © 2016年 郭进前. All rights reserved.
//

#import "AotulayoutVFLViewController.h"

@interface AotulayoutVFLViewController ()

@end

@implementation AotulayoutVFLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    /*
     * 需求
     *
     * 我们需要布局红(view_1)、绿(view_2)、蓝(view_3)三个view位置如图所示，
     * 他们距离父视图边距以及相互之间的距离都为30px，红色view和绿色view宽度相等，
     * 并且三个view的高度相等。并且在横屏时，他们的位置还是一样保持不变。
     *
     */
    
    //1.首先，创建视图控件，添加到self.view上
    
    UIView *view_1 = [[UIView alloc] init];
    view_1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view_1];
    UIView *view_2 = [[UIView alloc] init];
    view_2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view_2];
    UIView *view_3 = [[UIView alloc] init];
    view_3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view_3];
    
    //2.然后，记得要把AutoresizingMask布局关掉
    view_1.translatesAutoresizingMaskIntoConstraints = NO;
    view_2.translatesAutoresizingMaskIntoConstraints = NO;
    view_3.translatesAutoresizingMaskIntoConstraints = NO;
    
    //3.接着，添加约束
    
    // 间距
    NSNumber *margin = @(30);
    NSNumber *spacing = @(30);
    NSDictionary *views = NSDictionaryOfVariableBindings(view_1,view_2,view_3);
    
    // 添加水平方向的约束1
    NSString *vfl = @"H:|-margin-[view_1]-spacing-[view_2(==view_1)]-margin-|";
    NSDictionary *mertrics = NSDictionaryOfVariableBindings(margin,spacing);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:vfl options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:mertrics views:views];
    [self.view addConstraints:constraints];
    
    // 添加水平方向的约束2
    NSString *vfl1 = @"H:|-margin-[view_3]-margin-|";
    NSDictionary *mertrics1 = NSDictionaryOfVariableBindings(margin,spacing);
    
    NSArray *constraints1 = [NSLayoutConstraint constraintsWithVisualFormat:vfl1 options:kNilOptions metrics:mertrics1 views:views];
    [self.view addConstraints:constraints1];
    
    // 添加竖直方向的约束
    NSString *vfl2 = @"V:|-margin-[view_1]-spacing-[view_3(==view_1)]-margin-|";
    NSDictionary *mertrics2 = NSDictionaryOfVariableBindings(margin, spacing);
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:vfl2 options:kNilOptions metrics:mertrics2 views:views];
    [self.view addConstraints:constraints2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
