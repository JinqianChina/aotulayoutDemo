//
//  aotulayoutViewController.m
//  aotulayoutDemo
//
//  Created by 郭进 on 16/4/8.
//  Copyright © 2016年 郭进前. All rights reserved.
//

#import "aotulayoutViewController.h"

@interface aotulayoutViewController ()

@end

@implementation aotulayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    
    //3.接着，添加约束，先添加边距约束，再添加宽高约束（个人习惯）
    /*
     * 添加约束 公式：item1.attribute = multiplier ⨉ item2.attribute + constant
     */
    
    //view_1(红色)top 距离self.view的top
    NSLayoutConstraint *view_1TopToSuperViewTop = [NSLayoutConstraint constraintWithItem:view_1
                                                                               attribute:NSLayoutAttributeTop
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1
                                                                                constant:30];
    //view_1(红色)left 距离self.view的left
    NSLayoutConstraint *view_1LeftToSuperViewLeft = [NSLayoutConstraint constraintWithItem:view_1
                                                                                 attribute:NSLayoutAttributeLeft
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.view
                                                                                 attribute:NSLayoutAttributeLeft
                                                                                multiplier:1
                                                                                  constant:30];
    //view_1(红色)right 距离view_2(绿色)的left
    NSLayoutConstraint *view_1RightToview_2Left = [NSLayoutConstraint constraintWithItem:view_2
                                                                               attribute:NSLayoutAttributeLeft
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:view_1
                                                                               attribute:NSLayoutAttributeRight
                                                                              multiplier:1
                                                                                constant:30];
    //view_1(红色)bottom 距离view_3(蓝色)的top
    NSLayoutConstraint *view_1BottomToview_3Top = [NSLayoutConstraint constraintWithItem:view_1
                                                                               attribute:NSLayoutAttributeBottom
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:view_3
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1
                                                                                constant:- 30];
    
    //view_2(绿色)right 距离self.view的right
    NSLayoutConstraint *view_2RightToSuperViewRight = [NSLayoutConstraint constraintWithItem:view_2
                                                                                   attribute:NSLayoutAttributeRight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self.view
                                                                                   attribute:NSLayoutAttributeRight
                                                                                  multiplier:1
                                                                                    constant:- 30];
    
    
    //view_2(绿色)centerY 和 view_1(红色)的centerY 一致
    NSLayoutConstraint *view_2CenterYToView_1CenterY = [NSLayoutConstraint constraintWithItem:view_2
                                                                                    attribute:NSLayoutAttributeCenterY
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:view_1
                                                                                    attribute:NSLayoutAttributeCenterY
                                                                                   multiplier:1
                                                                                     constant:0];
    
    
    //view_3(蓝色)left 距离 self.view left
    NSLayoutConstraint *view_3LeftToSuperViewLeft = [NSLayoutConstraint constraintWithItem:view_3
                                                                                 attribute:NSLayoutAttributeLeft
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.view
                                                                                 attribute:NSLayoutAttributeLeft
                                                                                multiplier:1
                                                                                  constant:30];
    
    //view_3(蓝色)right 距离 self.view right
    NSLayoutConstraint *view_3RightToSuperViewRight = [NSLayoutConstraint constraintWithItem:view_3
                                                                                   attribute:NSLayoutAttributeRight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self.view
                                                                                   attribute:NSLayoutAttributeRight
                                                                                  multiplier:1
                                                                                    constant:- 30];
    
    //view_3(蓝色)Bottom 距离 self.view bottom
    NSLayoutConstraint *view_3BottomToSuperViewBottom = [NSLayoutConstraint constraintWithItem:view_3
                                                                                     attribute:NSLayoutAttributeBottom
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.view
                                                                                     attribute:NSLayoutAttributeBottom
                                                                                    multiplier:1
                                                                                      constant:- 30];
    
    
    
    //view_1(红色)width 和view_2(绿色)的width相等
    NSLayoutConstraint *view_1WidthToview_2Width = [NSLayoutConstraint constraintWithItem:view_2
                                                                                attribute:NSLayoutAttributeWidth
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:view_1
                                                                                attribute:NSLayoutAttributeWidth
                                                                               multiplier:1
                                                                                 constant:0];
    
    
    //view_1(红色)height 和view_2(绿色)的height相等
    NSLayoutConstraint *view_1HeightToview_2Height = [NSLayoutConstraint constraintWithItem:view_2
                                                                                  attribute:NSLayoutAttributeHeight
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:view_1
                                                                                  attribute:NSLayoutAttributeHeight
                                                                                 multiplier:1
                                                                                   constant:0];
    
    //view_1(红色)height 和 view_3(蓝色)的height相等
    NSLayoutConstraint *view_1HeightToview_3Height = [NSLayoutConstraint constraintWithItem:view_3
                                                                                  attribute:NSLayoutAttributeHeight
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:view_1
                                                                                  attribute:NSLayoutAttributeHeight
                                                                                 multiplier:1
                                                                                   constant:0];
    
    //添加约束，因为view_1、2、3是同层次关系，且他们公有的父视图都是self.view，所以这里把约束都添加到self.view上即可
    [self.view addConstraints:@[view_1TopToSuperViewTop,view_1LeftToSuperViewLeft,view_1RightToview_2Left,view_2RightToSuperViewRight,view_1WidthToview_2Width,view_1BottomToview_3Top,view_2CenterYToView_1CenterY,view_3LeftToSuperViewLeft,view_3RightToSuperViewRight,view_3BottomToSuperViewBottom,view_1HeightToview_2Height,view_1HeightToview_3Height]];
    
    [self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
