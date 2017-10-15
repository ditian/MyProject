

#import "TheViewController.h"
#import "TheView.h"
#import "MyStackView.h"

@interface TheViewController ()

@property (nonatomic) NSMutableArray *sv;
@property (nonatomic) UIButton *btn;

@end

@implementation TheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sv = [NSMutableArray array];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIStackView *stackView = [[UIStackView alloc] init];

    [self.view addSubview:stackView];
    
    stackView.layoutMargins = UIEdgeInsetsMake(15, 0, 5, 0);
    stackView.layoutMarginsRelativeArrangement = YES;
    
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionEqualSpacing;
    stackView.alignment = UIStackViewAlignmentLeading;
    stackView.spacing = 2;

    [stackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [stackView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [stackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    //[stackView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
    TheView *bgView = [TheView new];
    bgView.translatesAutoresizingMaskIntoConstraints = NO;
    bgView.backgroundColor = [UIColor orangeColor];
    [stackView addSubview:bgView];
    [stackView.leadingAnchor constraintEqualToAnchor:bgView.leadingAnchor].active = YES;
    [stackView.trailingAnchor constraintEqualToAnchor:bgView.trailingAnchor].active = YES;
    [stackView.topAnchor constraintEqualToAnchor:bgView.topAnchor].active = YES;
    [stackView.bottomAnchor constraintEqualToAnchor:bgView.bottomAnchor].active = YES;
    
    for (int i = 0; i < 5; i++) {
        TheView *v = [TheView new];
        v.backgroundColor = [UIColor blueColor];
        [self.sv addObject:v];
        [stackView addArrangedSubview:v];
    }
    
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.backgroundColor = [UIColor whiteColor];
    self.btn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.btn setTitle:@"  Invalidate intrinsic content size  " forState:UIControlStateNormal];
    [stackView addSubview:self.btn];
    [self.btn.trailingAnchor constraintEqualToAnchor:stackView.trailingAnchor].active = YES;
    //[self.btn.widthAnchor constraintLessThanOrEqualToConstant:100].active = YES;
    //[self.btn.heightAnchor constraintEqualToConstant:90].active = YES;
    [self.btn.centerYAnchor constraintEqualToAnchor:stackView.centerYAnchor].active = YES;
    [self.btn addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    MyStackView *msv = [[MyStackView alloc] init];
    [self.view addSubview:msv];
    [msv.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:50].active = YES;
    [msv.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:300].active = YES;
    //[msv.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-50].active = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:0.4
                     animations:^{
                         for (TheView *v in self.sv) {
                             [v.widthAnchor constraintEqualToConstant:300].active = YES;
                             [v setContentHuggingPriority:UILayoutPriorityRequired
                                                  forAxis:UILayoutConstraintAxisVertical];
                         }
                         [((TheView *)self.sv[3]) setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
                         [self.view layoutIfNeeded];
                     }];
}

- (void)buttonTapped:(id)sender {
    //[((TheView *)self.sv[3]) setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    //[((TheView *)self.sv[3]) setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    //[self.view setNeedsUpdateConstraints];
    //[self.view setNeedsLayout];
    //[self.view layoutIfNeeded];
    
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:0.4
                     animations:^{
                         // INVALIDATE INSTRINSIC CONTENT SIZE
                         TheView *v = (TheView *)self.sv[2];
                         v.intrinsicHeight = 425;
                         [v invalidateIntrinsicContentSize];
                         
                         TheView *v1 = (TheView *)self.sv[1];
                         v1.constraints[2].active = NO;
                         [v1.widthAnchor constraintEqualToConstant:25].active =NO;
                         
                         // OR
                         //[v.heightAnchor constraintEqualToConstant:425].active = YES;
                         [self.view layoutIfNeeded];
                     }];
    
//    for (TheView *v in self.sv) {
//        [v.heightAnchor constraintEqualToConstant:100].active = YES;
//        [v setContentHuggingPriority:UILayoutPriorityRequired
//                             forAxis:UILayoutConstraintAxisVertical];
//    }
    
    
    //[self.view setNeedsLayout];
    //[self.view layoutIfNeeded];
}

@end
