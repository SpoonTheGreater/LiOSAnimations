//
//  FirstViewController.h
//  animationLiOSObjc
//
//  Created by James Sadlier on 20/11/2016.
//  Copyright © 2016 James Sadlier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+remote.h"

#define TOP_BAR_MAX 64
#define TOP_BAR_MIN 20


@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UIView *topBar;
@property (nonatomic) UITableView *tableView;


@end

