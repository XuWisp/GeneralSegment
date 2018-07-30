//
//  DemoMainView.m
//  GeneralSegment
//
//  Created by xush on 2018/7/24.
//  Copyright © 2018年 Xush. All rights reserved.
//

#import "DemoMainView.h"

#define UIColorFromHex(hexValue)        [UIColor colorWithRed:(((hexValue & 0xFF0000) >> 16))/255.0f green:(((hexValue & 0xFF00) >> 8))/255.0f blue:((hexValue & 0xFF))/255.0f alpha:1.0f]

@interface DemoMainView () <UITableViewDataSource, UITableViewDelegate, GNRLSegmentDelegate>

@property (nonatomic, strong) NSMutableArray *cellDataMArr;
@property (nonatomic, strong) NSMutableArray *cellDetailMArr1;
@property (nonatomic, strong) NSMutableArray *cellDetailMArr2;

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
        _segmentV.btnDataArr = @[@"九阴真经", @"降龙十八掌", @"吸星大法", @"蛤蟆功"];//, @"辟邪剑谱", @"六脉神剑", @"狮吼功", @"如来神掌", @"太极八卦"];
        _segmentV.delegate = self;
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

- (NSMutableArray *)cellDataMArr {
    if (!_cellDataMArr) {
        NSMutableArray *mArr1 = [@[@"DataCount"] mutableCopy];
        NSMutableArray *mArr2 = [@[@"BtnTColor", @"BtnTColorS", @"BtnFont", @"BtnFontS", @"BtnWidth"] mutableCopy];
        NSMutableArray *mArr3 = [@[@"lineViewWidth", @"lineViewHeight", @"lineViewColor"] mutableCopy];
        NSMutableArray *mArr4 = [@[@"sepLineViewWidth", @"sepLineViewHeight", @"sepLineViewColor"] mutableCopy];
        NSMutableArray *mArr5 = [@[@"scrollView"] mutableCopy];
        _cellDataMArr = [@[mArr1, mArr2, mArr3, mArr4, mArr5] mutableCopy];
    }
    return _cellDataMArr;
}

- (NSMutableArray *)cellDetailMArr1 {
    if (!_cellDetailMArr1) {
        NSMutableArray *mArr1 = [@[@"->4"] mutableCopy];
        NSMutableArray *mArr2 = [@[@"BlackColor", @"BlackColor", @"SysFont18", @"SysFont20", @"0.0f"] mutableCopy];
        NSMutableArray *mArr3 = [@[@"BtnTextLength", @"4.0f", @"BlackColor"] mutableCopy];
        NSMutableArray *mArr4 = [@[@"1.0f", @"30.0f", @"GrayColor"] mutableCopy];
        NSMutableArray *mArr5 = [@[@"scrollView"] mutableCopy];
        _cellDetailMArr1 = [@[mArr1, mArr2, mArr3, mArr4, mArr5] mutableCopy];
    }
    return _cellDetailMArr1;
}

- (NSMutableArray *)cellDetailMArr2 {
    if (!_cellDetailMArr2) {
        NSMutableArray *mArr1 = [@[@"->9"] mutableCopy];
        NSMutableArray *mArr2 = [@[@"OrangeColor", @"RedColor", @"SysFont18Blod", @"SysFont20Blod", @"BtnTextLength+20.0f"] mutableCopy];
        NSMutableArray *mArr3 = [@[@"50", @"10.0f", @"CyanColor"] mutableCopy];
        NSMutableArray *mArr4 = [@[@"5.0f", @"50.0f", @"ClearColor"] mutableCopy];
        NSMutableArray *mArr5 = [@[@"scrollView"] mutableCopy];
        _cellDetailMArr2 = [@[mArr1, mArr2, mArr3, mArr4, mArr5] mutableCopy];
    }
    return _cellDetailMArr2;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cellDataMArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSMutableArray *)self.cellDataMArr[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *HomeMapIdentifier = @"mainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeMapIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:HomeMapIdentifier];
    }
    cell.textLabel.text = ((NSMutableArray *)self.cellDataMArr[indexPath.section])[indexPath.row];
    cell.detailTextLabel.text = self.cellDetailMArr1[indexPath.section][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 5))];
    view.backgroundColor = UIColorFromHex(0xf1f1f1);
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    BOOL isNormal = [cell.detailTextLabel.text isEqualToString:self.cellDetailMArr1[indexPath.section][indexPath.row]];
    if (isNormal) {
        cell.detailTextLabel.text = self.cellDetailMArr2[indexPath.section][indexPath.row];
    }else {
        cell.detailTextLabel.text = self.cellDetailMArr1[indexPath.section][indexPath.row];
    }
    switch (indexPath.section) {
        case 0: {
            switch (indexPath.row) {
                case 0:
                    
                    break;
                    
                default:
                    break;
            }
            break;}
        case 1: {
            switch (indexPath.row) {
                case 0: {
                    if (isNormal) {
                        [self.segmentV.demoBtn setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
                    }else {
                        [self.segmentV.demoBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
                    }
                    break;}
                case 1: {
                    if (isNormal) {
                        [self.segmentV.demoBtn setTitleColor:[UIColor redColor] forState:(UIControlStateSelected)];
                    }else {
                        [self.segmentV.demoBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
                    }
                    break;}
                case 2: {
                    if (isNormal) {
                        self.segmentV.Font = [UIFont boldSystemFontOfSize:18];
                    }else {
                        self.segmentV.Font = [UIFont systemFontOfSize:18];
                    }
                    break;}
                case 3: {
                    if (isNormal) {
                        self.segmentV.sFont = [UIFont boldSystemFontOfSize:20];
                    }else {
                        self.segmentV.sFont = [UIFont systemFontOfSize:20];
                    }
                    break;}
                case 4: {
                    if (isNormal) {
                        self.segmentV.demoBtn.frame = CGRectMake(0, 0, [self calculateRowWidth:self.cellDataMArr[indexPath.section][indexPath.section]]+20, 0);
                    }else {
                        self.segmentV.demoBtn.frame = CGRectMake(0, 0, 0, 0);
                    }
                    break;}

                default:
                    break;
            }
            break;}
        case 2: {
            switch (indexPath.row) {
                case 0: {
                    if (isNormal) {
                        self.segmentV.lineVWidth = 50;
                    }else {
                        self.segmentV.lineVWidth = 0;
                    }
                    break;}
                case 1: {
                    if (isNormal) {
                        self.segmentV.lineV.frame = CGRectMake(self.segmentV.lineV.frame.origin.x,
                                                               self.segmentV.frame.size.height-10,
                                                               self.segmentV.lineV.frame.size.width,
                                                               10.0f);
                    }else {
                        self.segmentV.lineV.frame = CGRectMake(self.segmentV.lineV.frame.origin.x,
                                                               self.segmentV.frame.size.height-4,
                                                               self.segmentV.lineV.frame.size.width,
                                                               4.0f);
                    }
                    break;}
                case 2: {
                    if (isNormal) {
                        self.segmentV.lineV.backgroundColor = [UIColor cyanColor];
                    }else {
                        self.segmentV.lineV.backgroundColor = [UIColor blackColor];
                    }
                    break;}
                default:
                    break;
            }
            break;}
        case 3: {
            switch (indexPath.row) {
                case 0: {
                    if (isNormal) {
                        self.segmentV.segLineV.frame = CGRectMake(self.segmentV.segLineV.frame.origin.x,
                                                               self.segmentV.segLineV.frame.origin.y,
                                                               5,
                                                               self.segmentV.segLineV.frame.size.height);
                    }else {
                        self.segmentV.segLineV.frame = CGRectMake(self.segmentV.segLineV.frame.origin.x,
                                                                  self.segmentV.segLineV.frame.origin.y,
                                                                  1,
                                                                  self.segmentV.segLineV.frame.size.height);
                    }
                    break;}
                case 1: {
                    if (isNormal) {
                        self.segmentV.segLineV.frame = CGRectMake(self.segmentV.segLineV.frame.origin.x,
                                                                  (self.segmentV.frame.size.height-50)/2,
                                                                  self.segmentV.segLineV.frame.size.width,
                                                                  50);
                    }else {
                        self.segmentV.segLineV.frame = CGRectMake(self.segmentV.segLineV.frame.origin.x,
                                                                  (self.segmentV.frame.size.height-30)/2,
                                                                  self.segmentV.segLineV.frame.size.width,
                                                                  30);
                    }
                    break;}
                case 2: {
                    if (isNormal) {
                        self.segmentV.segLineV.backgroundColor = [UIColor clearColor];
                    }else {
                        self.segmentV.segLineV.backgroundColor = [UIColor grayColor];
                    }
                    break;}
                default:
                    break;
            }
            break;}
        default:
            break;
    }
    [self.segmentV reloadScrollView];
}

#pragma mark - GNRLSegmentDelegate

- (void)btnClickAtIndex:(NSUInteger)index {
    self.tipLab.text = [NSString stringWithFormat:@"SegmentNum: %ld", index];
}

#pragma mark - action

- (CGFloat)calculateRowWidth:(NSString *)string {
    if (!self.segmentV.Font) {
        self.segmentV.Font = [UIFont systemFontOfSize:18];
    }
    NSDictionary *dic = @{NSFontAttributeName:self.segmentV.Font};  //指定字号
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, 30)/*计算宽度时要确定高度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width;
}

#pragma mark - other



#pragma mark - data set


@end
