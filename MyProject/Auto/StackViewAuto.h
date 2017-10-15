

#import <UIKit/UIKit.h>

@interface StackViewAuto : UIStackView

@property (nonatomic) CGFloat intrinsicWidth;
@property (nonatomic) CGFloat intrinsicHeight;

- (instancetype)initWithBackgroundColor:(UIColor *)bgColor;

@end
