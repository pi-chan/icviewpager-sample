//
//  PageController.m
//  icviewpager
//
//  Created by Hiromasa OHNO on 2014/01/22.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import "PageController.h"
#import "ContentViewController.h"

@interface PageController ()

@end

@implementation PageController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.dataSource = self;
    self.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager
{
    // タブの数
    return 5;
}

- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index
{
    // タブに表示するView、今回はUILabelを使用
    UILabel* label = [UILabel new];
    label.text = [NSString stringWithFormat:@"Tab #%i", index];
    [label sizeToFit];
    return label;
}

- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index
{
    // タブ番号に対応するUIViewControllerを返す
    ContentViewController* contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentViewController"];
    contentViewController.labelText = [NSString stringWithFormat:@"Tab #%i", index];
    return contentViewController;
}
@end
