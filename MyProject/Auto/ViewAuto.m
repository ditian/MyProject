
#import "ViewAuto.h"

@implementation ViewAuto

- (instancetype)init {
    if (self = [super init]) {
        _intrinsicWidth = 0;
        _intrinsicHeight = 0;
        _useAutoLayout = NO;
    }
    return self;
}

- (void)setUseAutoLayout:(BOOL)useAutoLayout {
    _useAutoLayout = useAutoLayout;
    self.translatesAutoresizingMaskIntoConstraints = !useAutoLayout;
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
