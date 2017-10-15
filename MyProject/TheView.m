

#import "TheView.h"

@implementation TheView

- (instancetype)init {
    if (self = [super init]) {
        _intrinsicHeight = 25;
    }
    return self;
}

- (CGSize)intrinsicContentSize {
    return CGSizeMake(133, self.intrinsicHeight);
}

@end
