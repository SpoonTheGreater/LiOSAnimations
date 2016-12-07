//
//  SecondViewController.h
//  animationLiOSObjc
//
//  Created by James Sadlier on 20/11/2016.
//  Copyright © 2016 James Sadlier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+remote.h"

#define TOP_BAR_MAX 224
#define TOP_BAR_MIN 44

@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UIImageView *topBar;
@property (nonatomic) UIVisualEffectView *blur;
@property (nonatomic) UITableView *tableView;

@end

