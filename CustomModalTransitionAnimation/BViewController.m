//
//  BViewController.m
//  CustomModalTransitionAnimation
//
//  Created by Baoqin Huang on 2017/6/25.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "BViewController.h"
#import "DismissAnimation.h"

@interface BViewController () <UIViewControllerTransitioningDelegate> {
    DismissAnimation *_dismissAnimation;
}

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation BViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _dismissAnimation = [[DismissAnimation alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _backButton.layer.cornerRadius = 8.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - button methods

- (IBAction)handeBackButtonPressed:(id)sender {
    self.transitioningDelegate = self;
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return _dismissAnimation;
}


@end
