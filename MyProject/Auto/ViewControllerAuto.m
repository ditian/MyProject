

#import "ViewControllerAuto.h"
#import "StackViewAuto.h"
#import "ViewAuto.h"

@interface ViewControllerAuto ()

@property (nonatomic) StackViewAuto *header;
@property (nonatomic) StackViewAuto *body;
@property (nonatomic) StackViewAuto *footer;

@end

@implementation ViewControllerAuto

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    // Header
    StackViewAuto *header = [[StackViewAuto alloc] initWithBackgroundColor:[UIColor whiteColor]];
    self.header = header;
    header.axis = UILayoutConstraintAxisVertical;
    header.distribution = UIStackViewDistributionEqualSpacing;
    header.alignment = UIStackViewAlignmentLeading;
    header.spacing = 5;

    [self.view addSubview:header];

    [header.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [header.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20].active = YES;
    header.intrinsicWidth = CGRectGetWidth(self.view.frame);
    header.intrinsicHeight = 0;

    // Body
    StackViewAuto *body = [[StackViewAuto alloc] initWithBackgroundColor:[UIColor whiteColor]];
    self.body = body;
    body.axis = UILayoutConstraintAxisVertical;
    body.distribution = UIStackViewAlignmentFill;
    body.alignment = UIStackViewAlignmentLeading;
    body.spacing = 5;

    [self.view addSubview:body];

    [body.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [body.topAnchor constraintEqualToAnchor:header.bottomAnchor constant:10].active = YES;
    //[body.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    body.intrinsicWidth = CGRectGetWidth(self.view.frame);
    
    // Footer
    StackViewAuto *footer = [[StackViewAuto alloc] initWithBackgroundColor:[UIColor whiteColor]];
    self.footer = footer;
    footer.axis = UILayoutConstraintAxisVertical;
    footer.distribution = UIStackViewDistributionEqualSpacing;
    footer.alignment = UIStackViewAlignmentLeading;
    footer.spacing = 5;

    [self.view addSubview:footer];

    [footer.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [footer.topAnchor constraintEqualToAnchor:body.bottomAnchor constant:10].active = YES;
    [footer.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    footer.intrinsicWidth = CGRectGetWidth(self.view.frame);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    ViewAuto *child1 = [[ViewAuto alloc] init];
    child1.backgroundColor = [UIColor cyanColor];
    child1.useAutoLayout = YES;
    child1.intrinsicWidth = CGRectGetWidth(self.header.frame);
    child1.intrinsicHeight = 30;
    [self.header addArrangedSubview:child1];
    
    ViewAuto *child2 = [[ViewAuto alloc] init];
    child2.backgroundColor = [UIColor purpleColor];
    child2.useAutoLayout = YES;
    child2.intrinsicWidth = CGRectGetWidth(self.header.frame);
    child2.intrinsicHeight = 50;
    [self.header addArrangedSubview:child2];

    ViewAuto *child3 = [[ViewAuto alloc] init];
    child3.backgroundColor = [UIColor orangeColor];
    child3.useAutoLayout = YES;
    child3.intrinsicWidth = CGRectGetWidth(self.header.frame);
    child3.intrinsicHeight = 70;
    [self.header addArrangedSubview:child3];
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
    dispatch_after(delayTime, dispatch_get_main_queue(), ^(void){
        ViewAuto *child4 = [[ViewAuto alloc] init];
        child4.backgroundColor = [UIColor orangeColor];
        child4.useAutoLayout = YES;
        child4.intrinsicWidth = 300;
        child4.intrinsicHeight = 75;
        [self.footer addArrangedSubview:child4];
    });
}

@end
