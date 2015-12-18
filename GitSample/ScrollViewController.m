//
//  ScrollViewController.m
//  GitSample
//
//  Created by cmh on 2015. 11. 20..
//  Copyright © 2015년 cmh. All rights reserved.
//

#import "ScrollViewController.h"
#import "UIScrollView+BottomRefreshControl.h"
#import "UIView+TKGeometry.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.numberOfItems = 20;
    
    self.topRefreshControl = [UIRefreshControl new];
    self.topRefreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull down to reload!"];
    [self.topRefreshControl addTarget:self action:@selector(refreshTop) forControlEvents:UIControlEventValueChanged];
    [self.scrollView addSubview:self.topRefreshControl];
    
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull up to reload!"];
    refreshControl.triggerVerticalOffset = 80.;
    [refreshControl addTarget:self action:@selector(refreshBottom) forControlEvents:UIControlEventValueChanged];
    self.scrollView.bottomRefreshControl = refreshControl;
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:0];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:0];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)refreshTop {
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        self.numberOfItems = MAX(0, self.numberOfItems-5);
        [self reloadData];
        [self.topRefreshControl endRefreshing];
    });
}

- (void)refreshBottom {
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        self.numberOfItems += 5;
        [self reloadData];
        [self.scrollView.bottomRefreshControl endRefreshing];
    });
}

- (void)reloadData {
    
}


- (void)keyboardWillShow:(NSNotification *)notification {
    
    NSDictionary *userInfo = [notification userInfo];
    
    NSTimeInterval duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect frameEnd = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [UIView animateWithDuration:duration animations:^{
        
        self.scrollView.contentInsetBottom = MAX(0., self.scrollView.maxY-frameEnd.origin.y);
        self.scrollView.scrollIndicatorInsets = self.scrollView.contentInset;
    }];
}


- (void)keyboardWillHide:(NSNotification *)notification {
    
    NSDictionary *userInfo = [notification userInfo];
    
    NSTimeInterval duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        
        self.scrollView.contentInsetBottom = 0;
        self.scrollView.scrollIndicatorInsets = self.scrollView.contentInset;
    }];
}




@end
