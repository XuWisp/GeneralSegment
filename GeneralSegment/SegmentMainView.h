//
//  SegmentMainView.h
//  GeneralSegmentEx
//
//  Created by 徐沙洪 on 2018/7/22.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GNRLSegmentDelegate <NSObject>
@required // 必须实现的方法
/**点击按钮*/
- (void)btnClickAtIndex:(NSUInteger)index;
@end

@interface SegmentMainView : UIView {
    NSArray *_btnDataArr;
}

@property (nonatomic, strong) UIButton *demoBtn;
@property (nonatomic, strong) UIFont *Font;
@property (nonatomic, strong) UIFont *sFont;

@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, assign) float lineVWidth;

@property (nonatomic, strong) UIView *segLineV;

@property (nonatomic, copy) NSArray *btnDataArr;

@property (nonatomic, assign) NSUInteger selectIndex;
@property (nonatomic, assign) float btnWidth;
@property (nonatomic, weak) id <GNRLSegmentDelegate> delegate;

- (void)lineMove:(NSUInteger)index;
// 设置Btn点击第几个-主动设置
- (void)segBtnClick:(UIButton *)btn;

- (void)reloadScrollView;
/**
 自定义设置控件
 
 @param TColor 文字颜色
 @param TSColor 被选中状态文字颜色
 @param font 文字字体
 @param SFont 被选中状态文字字体
 @param lineColor 线条颜色
 */
- (void)setTColor:(UIColor *)TColor TSColor:(UIColor *)TSColor font:(UIFont *)font sFont:(UIFont *)sFont lineColor:(UIColor *)lineColor;

@end
