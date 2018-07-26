//
//  SegmentMainView.m
//  GeneralSegmentEx
//
//  Created by 徐沙洪 on 2018/7/22.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import "SegmentMainView.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width

@interface SegmentMainView ()

@property (nonatomic, strong) UIScrollView *scrollV;
@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, strong) UIFont *Font;
@property (nonatomic, strong) UIFont *sFont;

@end

@implementation SegmentMainView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.scrollV];
        [self.scrollV addSubview:self.lineV];
    }
    return self;
}

#pragma mark - Lazy load

- (NSArray *)btnDataArr {
    if (!_btnDataArr) {
        _btnDataArr = [NSArray new];
    }
    return _btnDataArr;
}

- (void)setBtnDataArr:(NSArray *)btnDataArr {
    if (_btnDataArr == btnDataArr) {
        return;
    }
    _btnDataArr = btnDataArr;
    [self viewInitByArr];
}

- (UIScrollView *)scrollV {
    if (!_scrollV) {
        _scrollV = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollV.scrollEnabled = NO;
        _scrollV.showsVerticalScrollIndicator = FALSE;
        _scrollV.showsHorizontalScrollIndicator = FALSE;
    }
    return _scrollV;
}

- (UIView *)lineV {
    if (!_lineV) {
        _lineV = [[UIView alloc] initWithFrame:(CGRectMake(0, self.frame.size.height-4, kScreenW, 4))];
        _lineV.backgroundColor = [UIColor blackColor];
    }
    return _lineV;
}

- (void)setScrollEnabled:(BOOL)scrollEnabled {
    _scrollEnabled = scrollEnabled;
    if (scrollEnabled) {
        self.scrollV.scrollEnabled = YES;
    }else {
        self.scrollV.scrollEnabled = NO;
    }
    // [self viewInitByArr];
}

#pragma mark - view init

- (void)viewInitByArr {
    for (int i = 0; i < self.btnDataArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = (CGRectMake(kScreenW/self.btnDataArr.count * i,
                                0,
                                kScreenW/self.btnDataArr.count,
                                self.frame.size.height));
        [btn setTitle:self.btnDataArr[i] forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        if (self.scrollEnabled) {
            UIButton *previousBtn = (UIButton *)[self viewWithTag:1000+i-1];
            btn.frame = CGRectMake(previousBtn.frame.origin.x + previousBtn.frame.size.width,
                                   0,
                                   [self calculateRowWidth:self.btnDataArr[i]]+30,
                                   self.frame.size.height);
        }
        btn.tag = 1000+i;
        [btn addTarget:self action:@selector(subBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.scrollV addSubview:btn];
        if (i == self.btnDataArr.count-1) { // 设置最后一个按钮时，设置滑动视图画布大小
            self.scrollV.contentSize = CGSizeMake(btn.frame.origin.x + btn.frame.size.width, 0);
        }
        if (!i) { // 默认初始化选中第一个
            [self lineMove:0];
            btn.selected = YES;
        }
    }
}

#pragma mark - active

- (void)lineMove:(NSUInteger)index {
    UIButton *btn = [self viewWithTag:1000+index];
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect rect = weakSelf.lineV.frame;
        rect.size.width = [weakSelf calculateRowWidth:weakSelf.btnDataArr[index]];
        rect.origin.x = btn.center.x-rect.size.width/2;
        weakSelf.lineV.frame = rect;
//        weakSelf.lineV.frame.size.width = [weakSelf calculateRowWidth:weakSelf.btnDataArr[index]];
//        weakSelf.lineV.centerX = btn.centerX;
        if (weakSelf.scrollEnabled) {
            if (weakSelf.scrollV.contentSize.width < btn.center.x+weakSelf.frame.size.width/2) {
                weakSelf.scrollV.contentOffset = CGPointMake(weakSelf.scrollV.contentSize.width-weakSelf.frame.size.width, 0);
            }else if (btn.center.x < weakSelf.frame.size.width/2) {
                weakSelf.scrollV.contentOffset = CGPointMake(0, 0);
            }else {
                weakSelf.scrollV.contentOffset = CGPointMake(btn.center.x-weakSelf.frame.size.width/2, 0);
            }
        }
    } completion:^(BOOL finished) {
        weakSelf.scrollV.contentSize = weakSelf.scrollV.contentSize;
    }];
}

- (void)subBtnClick:(UIButton *)btn {
    for (int i = 0; i < self.btnDataArr.count; i++) {
        UIButton *abtn = [self viewWithTag:1000+i];
        abtn.selected = NO;
        abtn.titleLabel.font = self.Font;
    }
    btn.selected = YES;
    if (self.sFont) {
        btn.titleLabel.font = self.sFont;
    }
    NSUInteger index = btn.tag-1000;
    self.selectIndex = index;
    [self lineMove:index];
    [self.delegate btnClickAtIndex:index];
}

- (CGFloat)calculateRowWidth:(NSString *)string {
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};  //指定字号
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, 30)/*计算宽度时要确定高度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width;
}

- (void)setTColor:(UIColor *)TColor TSColor:(UIColor *)TSColor font:(UIFont *)font lineColor:(UIColor *)lineColor {
    for (int i = 0; i < self.btnDataArr.count; i++) {
        UIButton *btn = (UIButton *)[self viewWithTag:1000+i];
        [btn setTitleColor:TColor forState:UIControlStateNormal];
        [btn setTitleColor:TSColor forState:UIControlStateSelected];
        btn.titleLabel.font = font;
    }
    self.Font = font;
    self.lineV.backgroundColor = lineColor;
}

- (void)setTColor:(UIColor *)TColor TSColor:(UIColor *)TSColor font:(UIFont *)font sFont:(UIFont *)sFont lineColor:(UIColor *)lineColor {
    for (int i = 0; i < self.btnDataArr.count; i++) {
        UIButton *btn = (UIButton *)[self viewWithTag:1000+i];
        [btn setTitleColor:TColor forState:UIControlStateNormal];
        [btn setTitleColor:TSColor forState:UIControlStateSelected];
        btn.titleLabel.font = font;
    }
    self.Font = font;
    self.sFont = sFont;
    self.lineV.backgroundColor = lineColor;
}


@end

