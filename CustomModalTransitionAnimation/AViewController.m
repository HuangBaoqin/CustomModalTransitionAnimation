//
//  AViewController.m
//  CustomModalTransitionAnimation
//
//  Created by Baoqin Huang on 2017/6/25.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"
#import "PresentAnimation.h"

@interface AViewController () <UIViewControllerTransitioningDelegate> {
    PresentAnimation *_presentAnimation;
}

@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation AViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _presentAnimation = [[PresentAnimation alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _nextButton.layer.cornerRadius = 8.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - button methods

- (IBAction)handleNextButtonPressed:(id)sender {
    BViewController *bVC = [BViewController new];
    bVC.transitioningDelegate = self;
    bVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:bVC animated:YES completion:^{
        
    }];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return _presentAnimation;
}

@end
