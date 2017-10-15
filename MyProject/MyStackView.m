

#import "MyStackView.h"

@implementation MyStackView

- (instancetype)init {
    if (self = [super init]) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        UIView *v = [[UIView alloc] init];
        v.translatesAutoresizingMaskIntoConstraints = NO;
        v.backgroundColor = [UIColor cyanColor];
        [self addSubview:v];
        [v.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [v.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        [v.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [v.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    }
    return self;
}

- (CGSize)intrinsicContentSize {
    return CGSizeMake(133, 333);
}

@end
