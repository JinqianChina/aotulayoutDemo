//
//  AotulayoutMasonryViewController.m
//  aotulayoutDemo
//
//  Created by 郭进 on 16/4/29.
//  Copyright © 2016年 郭进前. All rights reserved.
//

#import "AotulayoutMasonryViewController.h"
#import "Masonry.h"

@interface AotulayoutMasonryViewController ()

@end

@implementation AotulayoutMasonryViewController

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
    
    __weak __typeof(self) weakSelf = self;//这里用一个弱引用来表示self，用于下面的Block中

    //先确定view_1的约束
    [view_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).with.offset(30); //view_1的上，距离self.view是30px
        make.left.equalTo(weakSelf.view.mas_left).with.offset(30); //view_1de左，距离self.view是30px
    }];
    
    //然后确定view_2的约束
    [view_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view_1.mas_centerY).with.offset(0); //view2 Y方向上的中心线和view_1相等
        make.left.equalTo(view_1.mas_right).with.offset(30); //view2 的左距离view_1的右距离为30px
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-30); //view_2的右距离self.view30px
        make.width.equalTo(view_1); //view_2的宽度和view_1相等
        make.height.equalTo(view_1); //view_2的高度和view_1相等
    }];
    
    //最后确定view_3的约束
    [view_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view_1.mas_bottom).with.offset(30); //view_3的上距离view_1的底部 30px
        make.left.equalTo(weakSelf.view.mas_left).with.offset(30); //view_3的左距离self.view 30px
        make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(30);//view_3的底部距离self.view 30px
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-30); //view_3的右距离self.view 30px
        make.height.equalTo(view_1);//view_3的高度和view_1相等
    }];
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
