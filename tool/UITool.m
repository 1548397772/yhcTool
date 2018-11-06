//
//  UITool.m
//  ceshi
//
//  Created by yhc on 2018/11/6.
//  Copyright © 2018 yhc. All rights reserved.
//

#import "UITool.h"
@implementation UITool

+ (UILabel *)labelWithFrame:(CGRect)frame  text:(NSString *)text textColor:(UIColor *)textColor  font:(int)font isBold:(BOOL)isBold  backgroundColor:(UIColor *)backgroundColor textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    if (textColor) {
        label.textColor = textColor;
    }else
    {
        label.textColor = [UIColor blackColor];
    }
    if (isBold) {
        label.font = [UIFont boldSystemFontOfSize:font];
    }else
    {
        label.font = [UIFont systemFontOfSize:font];
    }
    if (backgroundColor) {
        label.backgroundColor = backgroundColor;
    }
    label.textAlignment = textAlignment;
    return label;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame  title:(NSString *)title titleColor:(UIColor *)titleColor image:(NSString *)image titleFont:(int)titleFont backgroundColor:(UIColor *)backgroundColor backgroundImage:(NSString *)backgroundImage cornerRadius:(int)cornerRadius
{
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    if (image.length > 0) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    [btn.titleLabel setFont:[UIFont systemFontOfSize:titleFont]];
    if (backgroundColor) {
        btn.backgroundColor = backgroundColor;
    }
    if (cornerRadius > 0) {
        btn.layer.cornerRadius = cornerRadius;
        btn.clipsToBounds = YES;
    }
    if (backgroundImage) {
        [btn setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:UIControlStateNormal];
    }
    return btn;
}

+ (UITableView *)tableViewWithFrame:(CGRect)frame delegate:(id)delegate dataSource:(id)dataSource classCellArray:(NSArray <NSString *>*)classCellArray nibCellArray:(NSArray <NSString *>*)nibCellArray cornerRadius:(int)cornerRadius backgroundColor:(UIColor *)backgroundColor
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    tableView.delegate = delegate;
    tableView.dataSource = dataSource;
    if (classCellArray.count > 0) {
        for (NSString *classCellString in classCellArray) {
            Class class = NSClassFromString(classCellString);
            [tableView registerClass:class forCellReuseIdentifier:classCellString];
        }
    }
    if (nibCellArray.count > 0) {
        for (NSString *nibCellString in nibCellArray) {
            [tableView registerNib:[UINib nibWithNibName:nibCellString bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCellString];
        }
    }
    if (cornerRadius > 0) {
        tableView.layer.cornerRadius = cornerRadius;
        tableView.clipsToBounds = YES;
    }
    if (backgroundColor) {
        tableView.backgroundColor = backgroundColor;
    }
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    return tableView;
}

+ (UICollectionView *)collectViewWithFrame:(CGRect)frame layout:(UICollectionViewFlowLayout *)layout delegate:(id)delegate dataSource:(id)dataSource classCellArray:(NSArray <NSString *>*)classCellArray nibCellArray:(NSArray <NSString *>*)nibCellArray cornerRadius:(int)cornerRadius backgroundColor:(UIColor *)backgroundColor
{
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.delegate = delegate;
    collectionView.dataSource = dataSource;
    if (classCellArray.count > 0) {
        for (NSString *classCellString in classCellArray) {
            Class class = NSClassFromString(classCellString);
            [collectionView registerClass:class forCellWithReuseIdentifier:classCellString];
        }
    }
    if (nibCellArray.count > 0) {
        for (NSString *nibCellString in nibCellArray) {
            [collectionView registerNib:[UINib nibWithNibName:nibCellString bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:nibCellString];
        }
    }
    if (cornerRadius > 0) {
        collectionView.layer.cornerRadius = cornerRadius;
        collectionView.clipsToBounds = YES;
    }
    if (backgroundColor) {
        collectionView.backgroundColor = backgroundColor;
    }

    return collectionView;
}

+ (UITextView *)textViewWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor  font:(int)font backgroundColor:(UIColor *)backgroundColor
{
    UITextView *textView = [[UITextView alloc]initWithFrame:frame];
    textView.selectable = NO;
    textView.editable = NO;
    textView.text = text;
    textView.textColor = textColor;
    textView.font = [UIFont systemFontOfSize:font];
    if (backgroundColor) {
        textView.backgroundColor = backgroundColor;
    }
    return textView;
}


@end
