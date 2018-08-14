//
//  SegmentMainView.h
//  GeneralSegmentEx
//
//  Created by 徐沙洪 on 2018/7/22.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GNRLSegmentDelegate <NSObject>
@required
/**点击按钮*/
- (void)btnClickAtIndex:(NSUInteger)index;
@end

@interface SegmentMainView : UIView {
    NSArray *_btnDataArr;
}

/// Demo button sample
@property (nonatomic, strong) UIButton *demoBtn; // If demobtn.width is set to 0, the scrollView cannot slide, and demobtn.width divides the width of the scrollView equally. When not equal to 0, scrollView can slide
/// demoBtn.font for:UIControlStateNormal
@property (nonatomic, strong) UIFont *Font;
/// demoBtn.font for:UIControlStateSelected
@property (nonatomic, strong) UIFont *sFont;

/// Control bottom line
@property (nonatomic, strong) UIView *lineV;
/// The default width is the length of the button text
@property (nonatomic, assign) float lineVWidth;

/// The secant line sample
@property (nonatomic, strong) UIView *segLineV;

/// Button text data
@property (nonatomic, copy) NSArray *btnDataArr;

@property (nonatomic, weak) id <GNRLSegmentDelegate> delegate;

/// Trigger button click event
- (void)segBtnClick:(UIButton *)btn;

/// Trigger button click event without action
- (void)subBtnUnActionClick:(UIButton *)btn;

/// Overloading the view, This method is called after setting changes
- (void)reloadScrollView;

@end
