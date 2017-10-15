

#import "StackViewAuto.h"

@interface StackViewAuto ()

@property (nonatomic) UIView *bgView;

@end

@implementation StackViewAuto

- (instancetype)initWithBackgroundColor:(UIColor *)bgColor {
    if (self = [super init]) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        if (bgColor) {
            UIView *bgView = [[UIView alloc] init];
            bgView.backgroundColor = bgColor;
            bgView.translatesAutoresizingMaskIntoConstraints = NO;
            
            [self addSubview:bgView];
            
            [bgView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
            [bgView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
            [bgView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
            [bgView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
            
            _bgView = bgView;
        }
    }
    return self;
}

- (void)setIntrinsicWidth:(CGFloat)intrinsicWidth {
    _intrinsicWidth = intrinsicWidth;
    [self invalidateIntrinsicContentSize];
}

- (void)setIntrinsicHeight:(CGFloat)intrinsicHeight {
    _intrinsicHeight = intrinsicHeight;
    [self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize {
    return CGSizeMake(self.intrinsicWidth, self.intrinsicHeight);
}

@end
