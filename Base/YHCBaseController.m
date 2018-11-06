//
//  YHCBaseController.m
//  angerConstellation
//
//  Created by yhc on 2018/10/9.
//  Copyright © 2018年 yhc. All rights reserved.
//

#import "YHCBaseController.h"

@interface YHCBaseController ()
@property(nonatomic,copy)dispatch_block_t leftItemBlock;
@property(nonatomic,copy)dispatch_block_t rightItemBlock;
@end

@implementation YHCBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APPColor(236, 239, 243);
//    [self.navigationController.navigationBar setBarTintColor:UIColorFromRGB(0x618EA5)];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}

- (void)setLeftItemImage:(UIImage *)image actionBlock:(void (^)(void))leftAction
{
    if (self.navigationItem)
    {
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction:)];
        self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
        self.leftItemBlock = leftAction;
    }
    else
    {
        NSLog(@"Not foud Nav");
    }
}
- (void)setLeftItemText:(NSString *)text actionBlock:(void (^)(void))leftAction
{
    if (self.navigationItem)
    {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:text style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction:)];
        self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:233/255.f green:191/255.f blue:118/255.f alpha:1];
        self.leftItemBlock = leftAction;
    }
    else
    {
        NSLog(@"Not foud Nav");
    }
}

- (void)setRightItemImage:(UIImage *)image actionBlock:(void (^)(void))rightAction
{
    if (self.navigationItem)
    {
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction:)];
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
        self.rightItemBlock = rightAction;
    }
    else
    {
        NSLog(@"Not foud Nav");
    }
}
- (void)setRightItemText:(NSString *)text actionBlock:(void (^)(void))rightAction
{
    if (self.navigationItem)
    {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:text style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction:)];
        //        self.navigationItem.rightBarButtonItem.tintColor = APPCOLOR(233,191,118);
        self.rightItemBlock = rightAction;
    }
    else
    {
        NSLog(@"Not foud Nav");
    }
}

- (void)leftItemAction:(id)sender
{
    self.leftItemBlock();
}
- (void)rightItemAction:(id)sender
{
    self.rightItemBlock();
}

@end
