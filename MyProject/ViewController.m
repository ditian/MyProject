
#import "ViewController.h"
#import "TheViewController.h"
#import "ViewControllerAuto.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIView *root = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 390, 500)];
//    root.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:root];
//    root.translatesAutoresizingMaskIntoConstraints = false;
    
//    //UIStackView *stackView = [[UIStackView alloc] init];
//    UIView *stackView = [[UIView alloc] init];
//    stackView.translatesAutoresizingMaskIntoConstraints = NO;
////    stackView.axis = UILayoutConstraintAxisVertical;
////    stackView.distribution = UIStackViewDistributionFill;
////    stackView.alignment = UIStackViewAlignmentLeading;
////    stackView.spacing = 25;
//
//    [self.view addSubview:stackView];
//    //self.root.translatesAutoresizingMaskIntoConstraints = NO;
//    [stackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20];
//    //[stackView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20];
//    //[stackView.widthAnchor constraintEqualToConstant:400];
//    //[stackView.heightAnchor constraintEqualToConstant:400];
//    //[stackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor];
//    //[stackView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor];
//
//    TheView *bgView = [TheView new];
//    bgView.translatesAutoresizingMaskIntoConstraints = NO;
//    bgView.backgroundColor = [UIColor orangeColor];
//    [stackView addSubview:bgView];
//    [stackView.leadingAnchor constraintEqualToAnchor:bgView.leadingAnchor];
//    [stackView.trailingAnchor constraintEqualToAnchor:bgView.trailingAnchor];
//    [stackView.topAnchor constraintEqualToAnchor:bgView.topAnchor];
//    [stackView.bottomAnchor constraintEqualToAnchor:bgView.bottomAnchor];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //TheViewController *vc = [TheViewController new];
    //[self presentViewController:vc animated:YES completion:nil];
    ViewControllerAuto *vc = [ViewControllerAuto new];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
