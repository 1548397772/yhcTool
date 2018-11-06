//
//  YHCTabbarController.m
//  Slack Shades
//
//  Created by yhc on 2018/10/19.
//  Copyright © 2018年 yhc. All rights reserved.
//

#import "YHCTabbarController.h"



@interface YHCTabbarController ()

@end

@implementation YHCTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *imageArray = @[@"rec_nor",@"cla_nor",@"his_nor"];
    NSArray *selectImageArray = @[@"rec_sel",@"cla_sel",@"his_sel"];
    NSArray *titleArray = @[@"Recommend",@"Classify",@"History"];
    NSArray *controllerName = @[@"FACE_RecommendController",@"FACE_ClassifyController",@"FACE_HistoryController"];
    for (int i = 0; i < titleArray.count; i ++) {
        [self setupWithController:[[NSClassFromString(controllerName[i]) alloc]init] title:titleArray[i] image:imageArray[i] selectImage:selectImageArray[i]];
    }
}

- (void)setupWithController:(UIViewController *)controller title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage
{
    UITabBarItem *item = [[UITabBarItem alloc]init];
    item.title = title;
//    self.tabBar.tintColor = [UIColor whiteColor];   //相当于选中颜色
    
    self.tabBar.barTintColor = UIColorFromRGB(0x618EA5);
    
    item.image = [UIImage imageNamed:image];
    item.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem = item;
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = UIColorFromRGB(0x8d8d8d);
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [controller.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
   
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xA1C9BE)} forState:UIControlStateSelected];
    [controller initTitle:title];
    YHCNavigationController *nav = [[YHCNavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:nav];
}
@end
