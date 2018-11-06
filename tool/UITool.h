//
//  UITool.h
//  ceshi
//
//  Created by yhc on 2018/11/6.
//  Copyright © 2018 yhc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITool : NSObject
+ (UILabel *)labelWithFrame:(CGRect)frame  text:(NSString *)text textColor:(UIColor *)textColor  font:(int)font isBold:(BOOL)isBold  backgroundColor:(UIColor *)backgroundColor textAlignment:(NSTextAlignment)textAlignment;
+ (UIButton *)buttonWithFrame:(CGRect)frame  title:(NSString *)title titleColor:(UIColor *)titleColor image:(NSString *)image titleFont:(int)titleFont backgroundColor:(UIColor *)backgroundColor backgroundImage:(NSString *)backgroundImage cornerRadius:(int)cornerRadius;
+ (UITableView *)tableViewWithFrame:(CGRect)frame delegate:(id)delegate dataSource:(id)dataSource classCellArray:(NSArray <NSString *>*)classCellArray nibCellArray:(NSArray <NSString *>*)nibCellArray cornerRadius:(int)cornerRadius backgroundColor:(UIColor *)backgroundColor;
+ (UICollectionView *)collectViewWithFrame:(CGRect)frame layout:(UICollectionViewFlowLayout *)layout delegate:(id)delegate dataSource:(id)dataSource classCellArray:(NSArray <NSString *>*)classCellArray nibCellArray:(NSArray <NSString *>*)nibCellArray cornerRadius:(int)cornerRadius backgroundColor:(UIColor *)backgroundColor;
+ (UITextView *)textViewWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor  font:(int)font backgroundColor:(UIColor *)backgroundColor;

@end

NS_ASSUME_NONNULL_END
