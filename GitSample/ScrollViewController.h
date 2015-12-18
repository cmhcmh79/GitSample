//
//  ScrollViewController.h
//  GitSample
//
//  Created by cmh on 2015. 11. 20..
//  Copyright © 2015년 cmh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIRefreshControl *topRefreshControl;

@property (nonatomic) NSInteger numberOfItems;

- (void)reloadData;


@end
