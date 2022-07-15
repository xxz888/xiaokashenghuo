

#define kScreenWidth               [UIScreen mainScreen].bounds.size.width
#define kScreenHeight              [UIScreen mainScreen].bounds.size.height
#define kMainWindow                [UIApplication sharedApplication].keyWindow

#define kArrowWidth          15
#define kArrowHeight         10
#define kDefaultMargin       10
#define kAnimationTime       0.25

#import "HMNBa_mView.h"

@interface UIView (YCFrame)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize  size;
@end

@implementation UIView (YCFrame)

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setY:(CGFloat)value
{
    CGRect frame = self.frame;
    frame.origin.y = value;
    self.frame = frame;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setX:(CGFloat)value
{
    CGRect frame = self.frame;
    frame.origin.x = value;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
@end

@interface ODfApgj_wFyCell : UITableViewCell
@property (nonatomic,assign) BOOL         isShowSeparator;
@property (nonatomic,strong) UIColor    * separatorColor;
@end
@implementation ODfApgj_wFyCell

- (void)drawRect:(CGRect)rect{
    if (!_isShowSeparator)return;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, rect.size.height - 0.5, rect.size.width, 0.5)];
    [_separatorColor setFill];
    [path fillWithBlendMode:kCGBlendModeNormal alpha:1.0f];
    [path closePath];
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _isShowSeparator = YES;
        _separatorColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setSeparatorColor:(UIColor *)separatorColor{
    _separatorColor = separatorColor;
    [self setNeedsDisplay];
}

- (void)setIsShowSeparator:(BOOL)isShowSeparator{
    _isShowSeparator = isShowSeparator;
    [self setNeedsDisplay];
}
@end


@interface LPUakedZmoad_0()
@property (nonatomic) NSString      *title;
@property (nonatomic) UIImage       *image;
@property (copy, nonatomic)void (^handler)(LPUakedZmoad_0 *);
@end
@implementation LPUakedZmoad_0

+ (instancetype)actionWithTitle:(NSString *)title image:(UIImage *)image handler:(void (^)(LPUakedZmoad_0 *))handler{
    LPUakedZmoad_0 *action = [[LPUakedZmoad_0 alloc] initWithTitle:title image:image handler:handler];
    return action;
}

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image handler:(void (^)(LPUakedZmoad_0 *))handler{
    if (self = [super init]) {
        _title = title;
        _image = image;
        _handler = [handler copy];
    }
    return self;
}
@end


@interface HMNBa_mView()<UITableViewDelegate,UITableViewDataSource>
{
    CGPoint          _refPoint;
    UIView          *_refView;
    CGFloat          _menuWidth;
    
    CGFloat         _arrowPosition; 
    CGFloat         _topMargin;
    BOOL            _isReverse; 
    BOOL            _needReload; 
}
@property(nonatomic,copy) NSArray<LPUakedZmoad_0 *>   *actions;
@property(nonatomic,strong)UITableView              *tableView;
@property(nonatomic,strong)UIView                   *contentView;
@property(nonatomic,strong)UIView                   *bgView;

@end

static NSString *const menuCellID = @"ODfApgj_wFyCell";
@implementation HMNBa_mView


- (void)setOffset:(CGFloat)offset{
    if (offset == offset) return;
    _offset = offset;
    if (offset < 0.0f) {
        offset = 0.0f;
    }
    self.y += self.y >= _refPoint.y ? offset : -offset;
}

- (void)setSeparatorColor:(UIColor *)separatorColor{
    if ([_separatorColor isEqual:separatorColor]) return;
    _separatorColor = separatorColor;
    [self.tableView reloadData];
}


- (instancetype)initWithActions:(NSArray<LPUakedZmoad_0 *> *)actions width:(CGFloat)width atPoint:(CGPoint)point{
    if (self = [super init]) {
        _actions = [actions copy];
        _refPoint = point;
        _menuWidth = width;
        [self defaultConfiguration];
        [self gnatNovelist];
    }
    return self;
}


- (CGPoint)depositPaleolithicHe{
    CGRect absoluteRect = [_refView convertRect:_refView.bounds toView:kMainWindow];
    CGPoint refPoint;
    if (absoluteRect.origin.y + absoluteRect.size.height + _actions.count * _menuCellHeight > kScreenHeight - 10) {
        refPoint = CGPointMake(absoluteRect.origin.x + absoluteRect.size.width / 2, absoluteRect.origin.y);
        _isReverse = YES;
    }else{
        refPoint = CGPointMake(absoluteRect.origin.x + absoluteRect.size.width / 2, absoluteRect.origin.y + absoluteRect.size.height);
        _isReverse = NO;
    }
    return refPoint;
}


- (void)setIsShowShadow:(BOOL)isShowShadow{
    if (_isShowShadow == isShowShadow)return;
    _isShowShadow = isShowShadow;
    if (!_isShowShadow) {
        self.layer.shadowOpacity = 0.0;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowRadius = 0.0;
    }else{
        [self reconstructBuckUnexceptionableSugar];
    }
}


- (void)reconstructBuckUnexceptionableSugar{
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowRadius = 5.0;
}


- (void)reloadData{
    [self.contentView removeFromSuperview];
    [self.tableView removeFromSuperview];
    self.contentView = nil;
    self.tableView = nil;
    [self gnatNovelist];
}


- (void)setTextColor:(UIColor *)textColor{
    if ([_textColor isEqual:textColor]) return;
    _textColor = textColor;
    [self.tableView reloadData];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_dismissOnselected) [self dismiss];
    LPUakedZmoad_0 *action = _actions[indexPath.row];
    if (action.handler) {
        action.handler(action);
    }
}


- (instancetype)initWithActions:(NSArray<LPUakedZmoad_0 *> *)actions width:(CGFloat)width relyonView:(id)view{
    if (self = [super init]) {
        
        if ([view isKindOfClass:[UIBarButtonItem class]]) {
            UIView *bgView = [view valueForKey:@"_view"];
            _refView = bgView;
        }else{
            _refView = view;
        }
        _actions = [actions copy];
        _menuWidth = width;
        [self defaultConfiguration];
        [self gnatNovelist];
    }
    return self;
}

#pragma mark - Private

- (void)gnatNovelist{
    [self fondEffrontery];
    [self cardboardSupremeGroup];
    [self addSubview:self.contentView];
}


- (void)fondEffrontery{
    if (_refView) {
        _refPoint = [self depositPaleolithicHe];
    }
    
    CGFloat originX;
    CGFloat originY;
    CGFloat width;
    CGFloat height;
    
    width = _menuWidth;
    height = (_actions.count > _maxDisplayCount) ? _maxDisplayCount * _menuCellHeight + kArrowHeight: _actions.count * _menuCellHeight + kArrowHeight;
    
    _arrowPosition = 0.5 * width - 0.5 * kArrowWidth;
    
    
    originX = _refPoint.x - _arrowPosition - 0.5 * kArrowWidth;
    originY = _refPoint.y;
    
    
    if (originX + width > kScreenWidth - 10) {
        originX = kScreenWidth - kDefaultMargin - width;
    }else if (originX < 10) {
        
        originX = kDefaultMargin;
    }
    
    
    if ((_refPoint.x <= originX + width - _cornerRaius) && (_refPoint.x >= originX + _cornerRaius)) {
        _arrowPosition = _refPoint.x - originX - 0.5 * kArrowWidth;
    }else if (_refPoint.x < originX + _cornerRaius) {
        _arrowPosition = _cornerRaius;
    }else {
        _arrowPosition = width - _cornerRaius - kArrowWidth;
    }
    
    
    if (!_refView) {
        _isReverse = (originY + height > kScreenHeight - kDefaultMargin)?YES:NO;
    }
    
    CGPoint  anchorPoint;
    if (_isReverse) {
        originY = _refPoint.y - height;
        anchorPoint = CGPointMake(fabs(_arrowPosition) / width, 1);
        _topMargin = 0;
    }else{
        anchorPoint = CGPointMake(fabs(_arrowPosition) / width, 0);
        _topMargin = kArrowHeight;
    }
    originY += originY >= _refPoint.y ? _offset : -_offset;
    
    
    self.layer.anchorPoint = anchorPoint;
    self.frame = CGRectMake(originX, originY, width, height);
}


- (void)show{
    
    if (_needReload) [self reloadData];
    
    [kMainWindow addSubview: self.bgView];
    [kMainWindow addSubview: self];
    self.layer.affineTransform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration: kAnimationTime animations:^{
        self.layer.affineTransform = CGAffineTransformMakeScale(1.0, 1.0);
        self.alpha = 1.0f;
        self.bgView.alpha = 1.0f;
    }];
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:self.bounds];
        _contentView.backgroundColor = _menuColor;
        _contentView.layer.masksToBounds = YES;
        [_contentView addSubview:self.tableView];
    }
    return _contentView;
}

#pragma mark - <UITableViewDelegate,UITableViewDataSource>

- (CAShapeLayer *)undeservedAcute{
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    CGFloat bottomMargin = !_isReverse?0 :kArrowHeight;
    
    
    CGPoint topRightArcCenter = CGPointMake(self.width - _cornerRaius, _topMargin + _cornerRaius);
    CGPoint topLeftArcCenter = CGPointMake(_cornerRaius, _topMargin + _cornerRaius);
    CGPoint bottomRightArcCenter = CGPointMake(self.width - _cornerRaius, self.height - bottomMargin - _cornerRaius);
    CGPoint bottomLeftArcCenter = CGPointMake(_cornerRaius, self.height - bottomMargin - _cornerRaius);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint: CGPointMake(0, _topMargin + _cornerRaius)];
    [path addLineToPoint: CGPointMake(0, bottomLeftArcCenter.y)];
    [path addArcWithCenter: bottomLeftArcCenter radius: _cornerRaius startAngle: -M_PI endAngle: -M_PI-M_PI_2 clockwise: NO];
    
    if (_isReverse) {
        [path addLineToPoint: CGPointMake(_arrowPosition, self.height - kArrowHeight)];
        [path addLineToPoint: CGPointMake(_arrowPosition + 0.5*kArrowWidth, self.height)];
        [path addLineToPoint: CGPointMake(_arrowPosition + kArrowWidth, self.height - kArrowHeight)];
    }
    [path addLineToPoint: CGPointMake(self.width - _cornerRaius, self.height - bottomMargin)];
    [path addArcWithCenter: bottomRightArcCenter radius: _cornerRaius startAngle: -M_PI-M_PI_2 endAngle: -M_PI*2 clockwise: NO];
    [path addLineToPoint: CGPointMake(self.width, self.height - bottomMargin + _cornerRaius)];
    [path addArcWithCenter: topRightArcCenter radius: _cornerRaius startAngle: 0 endAngle: -M_PI_2 clockwise: NO];
    
    if (!_isReverse) {
        [path addLineToPoint: CGPointMake(_arrowPosition + kArrowWidth, _topMargin)];
        [path addLineToPoint: CGPointMake(_arrowPosition + 0.5 * kArrowWidth, 0)];
        [path addLineToPoint: CGPointMake(_arrowPosition, _topMargin)];
    }
    
    [path addLineToPoint: CGPointMake(_cornerRaius, _topMargin)];
    [path addArcWithCenter: topLeftArcCenter radius: _cornerRaius startAngle: -M_PI_2 endAngle: -M_PI clockwise: NO];
    [path closePath];
    
    maskLayer.path = path.CGPath;
    return maskLayer;
}

- (void)defaultConfiguration{
    self.alpha = 0.0f;
    [self reconstructBuckUnexceptionableSugar];
    
    _cornerRaius = 5.0f;
    _separatorColor = [UIColor blackColor];
    _menuColor = [UIColor whiteColor];
    _menuCellHeight = 44.0f;
    _maxDisplayCount = 5;
    _isShowShadow = YES;
    _dismissOnselected = YES;
    _dismissOnTouchOutside = YES;
    
    _textColor = [UIColor blackColor];
    _textFont = [UIFont systemFontOfSize:15.0f];
    _offset = 0.0f;
}

- (void)cardboardSupremeGroup{
    CAShapeLayer *layer = [self undeservedAcute];
    self.contentView.layer.mask = layer;
}

#pragma mark - Setting&&Getting

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
        _bgView.alpha = 0.0f;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _topMargin, self.width, self.height - kArrowHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = _actions.count > _maxDisplayCount? YES : NO;
        _tableView.rowHeight = _menuCellHeight;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ODfApgj_wFyCell class] forCellReuseIdentifier:menuCellID];
    }
    return _tableView;
}


- (void)setMenuColor:(UIColor *)menuColor{
    if ([_menuColor isEqual:menuColor]) return;
    _menuColor = menuColor;
    self.contentView.backgroundColor = menuColor;
}
#pragma mark - 设置属性

- (void)setMaxDisplayCount:(NSInteger)maxDisplayCount{
    if (_maxDisplayCount == maxDisplayCount)return;
    _maxDisplayCount = maxDisplayCount;
    _needReload = YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ODfApgj_wFyCell *cell = [tableView dequeueReusableCellWithIdentifier:menuCellID forIndexPath:indexPath];
    LPUakedZmoad_0 *action = _actions[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = _textFont;
    cell.textLabel.textColor = _textColor;
    cell.textLabel.text = action.title;
    cell.separatorColor = _separatorColor;
    cell.imageView.image = action.image?action.image:nil;
    if (action.image == nil) {
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    if (indexPath.row == _actions.count - 1) {
        cell.isShowSeparator = NO;
    }
    if ([self.menuSelectCell isEqualToString:action.title]) {
        cell.contentView.backgroundColor = FontThemeColor;
    }
    return cell;
}

- (void)setTextFont:(UIFont *)textFont{
    if ([_textFont isEqual:textFont]) return;
    _textFont = textFont;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _actions.count;
}

+ (instancetype)menuWithActions:(NSArray<LPUakedZmoad_0 *> *)actions width:(CGFloat)width atPoint:(CGPoint)point{
    NSAssert(width>0.0f, @"width要大于0");
    HMNBa_mView *menu = [[HMNBa_mView alloc] initWithActions:actions width:width atPoint:point];
    return menu;
}

- (void)setMenuCellHeight:(CGFloat)menuCellHeight{
    if (_menuCellHeight == menuCellHeight)return;
    _menuCellHeight = menuCellHeight;
    _needReload = YES;
}

- (void)setCornerRaius:(CGFloat)cornerRaius{
    if (_cornerRaius == cornerRaius)return;
    _cornerRaius = cornerRaius;
    self.contentView.layer.mask = [self undeservedAcute];
}

+ (instancetype)menuWithActions:(NSArray<LPUakedZmoad_0 *> *)actions width:(CGFloat)width relyonView:(id)view{
    NSAssert(width>0.0f, @"width要大于0");
    NSAssert([view isKindOfClass:[UIView class]]||[view isKindOfClass:[UIBarButtonItem class]], @"relyonView必须是UIView或UIBarButtonItem");
    HMNBa_mView *menu = [[HMNBa_mView alloc] initWithActions:actions width:width relyonView:view];
    return menu;
}

- (void)dismiss{
    if (!_dismissOnTouchOutside) return;
    [UIView animateWithDuration: kAnimationTime animations:^{
        self.layer.affineTransform = CGAffineTransformMakeScale(0.1, 0.1);
        self.alpha = 0.0f;
        self.bgView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.bgView removeFromSuperview];
        self.actions = nil;
    }];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor{
    if ([_menuColor isEqual:backgroundColor]) return;
    _menuColor = backgroundColor;
    self.contentView.backgroundColor = _menuColor;
}
@end
