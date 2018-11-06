//
//  YHCBaseController.h
//  angerConstellation
//
//  Created by yhc on 2018/10/9.
//  Copyright © 2018年 yhc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHCBaseController : UIViewController
@property(nonatomic,assign)BOOL isHideBack;
- (void)setLeftItemImage:(UIImage *)image actionBlock:(void (^)(void))leftAction;
- (void)setLeftItemText:(NSString *)text actionBlock:(void (^)(void))leftAction;

- (void)setRightItemImage:(UIImage *)image actionBlock:(void (^)(void))rightAction;
- (void)setRightItemText:(NSString *)text actionBlock:(void (^)(void))rightAction;
@end

NS_ASSUME_NONNULL_END
