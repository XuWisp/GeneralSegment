# GeneralSegment
A swift and general SegmentView.
![image](http://upload-images.jianshu.io/upload_images/1373377-b11d71bae55a012d?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

以上是层级图

* * *

# 控件属性

### @property (nonatomic, strong) UIButton *demoBtn;

按钮样式设置

如果demobtn.width设置为0,scrollView不能滑动，demobtn.width与滚动视图的平均宽度相等。当不等于0时，scrollView可以滑动

### @property (nonatomic, strong) UIFont *Font;

按钮常规状态下的字体

### @property (nonatomic, strong) UIFont *sFont;

按钮选中状态下的字体

### @property (nonatomic, strong) UIView *lineV;

控件底部的选中线

### @property (nonatomic, assign) float lineVWidth;

线宽默认与对应按钮文字长度等长

### @property (nonatomic, strong) UIView *segLineV;

按钮之间的分割线

### @property (nonatomic, copy) NSArray *btnDataArr;

按钮标题数组，创建控件必用

* * *

# 方法

### - (void)segBtnClick:(UIButton*)btn;

主动调用点击方法

### - (void)subBtnUnActionClick:(UIButton*)btn;

主动调用点击方法并不执行代理

### - (void)reloadScrollView;

重载控件，更改属性后调用

* * *

# 代理

### GNRLSegmentDelegate

### - (void)btnClickAtIndex:(NSUInteger)index;

代理方法，点击按钮传递事件

* * *

# 代码示例                    

``` objc
self.segmentV = [[SegmentMainView alloc] initWithFrame:(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50))];
self.segmentV.backgroundColor = UIColorFromHex(0xedfaff);
self.segmentV.btnDataArr = @[@"九阴真经", @"降龙十八掌", @"吸星大法", @"蛤蟆功"];
self.segmentV.delegate = self;

[self.segmentV.demoBtn setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
[self.segmentV.demoBtn setTitleColor:[UIColor redColor] forState:(UIControlStateSelected)];
self.segmentV.Font = [UIFont boldSystemFontOfSize:18];
self.segmentV.sFont = [UIFont boldSystemFontOfSize:20];
self.segmentV.demoBtn.frame = CGRectMake(0, 0, [self calculateRowWidth:self.cellDataMArr[indexPath.section][indexPath.section]]+20, 0);

self.segmentV.lineVWidth = 50;
self.segmentV.lineV.frame = CGRectMake(self.segmentV.lineV.frame.origin.x, self.segmentV.frame.size.height-10, self.segmentV.lineV.frame.size.width, 10.0f);
self.segmentV.lineV.backgroundColor = [UIColor cyanColor];

self.segmentV.segLineV.frame = CGRectMake(self.segmentV.segLineV.frame.origin.x, self.segmentV.segLineV.frame.origin.y,  5,  self.segmentV.segLineV.frame.size.height);
self.segmentV.segLineV.backgroundColor = [UIColor clearColor];

[self.segmentV reloadScrollView];
```
* * *

# 传送门

[轻量级滚动菜单--GeneralSegment](https://github.com/XuWisp/GeneralSegment)
