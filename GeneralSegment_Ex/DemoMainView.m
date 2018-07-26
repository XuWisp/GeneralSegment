//
//  DemoMainView.m
//  GeneralSegment
//
//  Created by xush on 2018/7/24.
//  Copyright © 2018年 Xush. All rights reserved.
//

#import "DemoMainView.h"

#define UIColorFromHex(hexValue)        [UIColor colorWithRed:(((hexValue & 0xFF0000) >> 16))/255.0f green:(((hexValue & 0xFF00) >> 8))/255.0f blue:((hexValue & 0xFF))/255.0f alpha:1.0f]

@interface DemoMainView () <UITableViewDataSource, UITableViewDelegate>

@end

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

- (SegmentMainView *)segmentV {
    if (!_segmentV) {
        _segmentV = [[SegmentMainView alloc] initWithFrame:(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50))];
        _segmentV.backgroundColor = UIColorFromHex(0xedfaff);
        _segmentV.btnDataArr = @[@"第1组", @"第2组", @"第3组", @"第4组"];//, @"第5组", @"第6组", @"第7组", @"第8组", @"第9组"];
        _segmentV.scrollEnabled = YES;
    }
    return _segmentV;
}

- (UILabel *)tipLab {
    if (!_tipLab) {
        _tipLab = [[UILabel alloc] initWithFrame:(CGRectMake(0, self.segmentV.frame.size.height, [UIScreen mainScreen].bounds.size.width, 50))];
        _tipLab.backgroundColor = UIColorFromHex(0xff9f37);
        _tipLab.textAlignment = NSTextAlignmentCenter;
        _tipLab.text = @"请选择";
    }
    return _tipLab;
}

- (UITableView *)setTV {
    if (!_setTV) {
        float top = (self.tipLab.frame.origin.y+self.tipLab.frame.size.height);
        _setTV = [[UITableView alloc] initWithFrame:(CGRectMake(0,
                                                                top,
                                                                [UIScreen mainScreen].bounds.size.width,
                                                                self.frame.size.height-top))
                                              style:(UITableViewStylePlain)];
        _setTV.dataSource = self;
        _setTV.delegate = self;
    }
    return _setTV;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *HomeMapIdentifier = @"mainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeMapIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:HomeMapIdentifier];
    }
    return cell;
}

#pragma mark - UITableViewDelegate


#pragma mark - action



#pragma mark - other



#pragma mark - data set


@end
