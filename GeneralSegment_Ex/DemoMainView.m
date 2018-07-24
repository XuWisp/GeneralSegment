//
//  DemoMainView.m
//  GeneralSegment
//
//  Created by xush on 2018/7/24.
//  Copyright © 2018年 Xush. All rights reserved.
//

#import "DemoMainView.h"

@implementation DemoMainView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.segmentV];
    [self addSubview:self.tipLab];
    [self addSubview:self.setTV];
}

#pragma mark - lazyload



#pragma mark - action



#pragma mark - other



#pragma mark - data set


@end
