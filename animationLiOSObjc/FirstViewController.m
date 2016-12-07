//
//  FirstViewController.m
//  animationLiOSObjc
//
//  Created by James Sadlier on 20/11/2016.
//  Copyright © 2016 James Sadlier. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpTopBar];
    [self setUpTableView];
}

- (void)setUpTopBar
{
    self.topBar = [[UIView alloc] initWithFrame:(CGRect){0,0,self.view.frame.size.width,TOP_BAR_MAX}];
    [self.topBar setBackgroundColor:[UIColor magentaColor]];
    [self.view addSubview:self.topBar];
}

- (void)setUpTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:(CGRect){0,self.topBar.frame.size.height,self.view.frame.size.width,self.view.frame.size.height-TOP_BAR_MAX}];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CELL"];
    UIImageView *cellImage = [[UIImageView alloc] initWithFrame:(CGRect){0,0,self.view.frame.size.width,[self tableView:tableView heightForRowAtIndexPath:indexPath]}];
    NSString *imageURLString = [NSString stringWithFormat:@"http://lorempixel.com/%.0f/%.0f/",cellImage.frame.size.width,cellImage.frame.size.height];
    [cellImage imageFromURL:[NSURL URLWithString:imageURLString] withCompletion:^(bool success) {
        //complete :D
    } animated:YES];
    [cell setBackgroundView:cellImage];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (double)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.width * 0.35;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if( scrollView.contentOffset.y > TOP_BAR_MAX-TOP_BAR_MIN)
    {
        //force to min
        [self.topBar setFrame:(CGRect){self.topBar.frame.origin,self.topBar.frame.size.width,TOP_BAR_MIN }];
        [self.tableView setFrame:(CGRect){0,self.topBar.frame.size.height,self.view.frame.size.width,self.view.frame.size.height-self.topBar.frame.size.height}];
    }
    else if (scrollView.contentOffset.y < TOP_BAR_MIN)
    {
        //force to max
        [self.topBar setFrame:(CGRect){self.topBar.frame.origin,self.topBar.frame.size.width,TOP_BAR_MAX }];
        [self.tableView setFrame:(CGRect){0,self.topBar.frame.size.height,self.view.frame.size.width,self.view.frame.size.height-self.topBar.frame.size.height}];
    }
    else
    {
        //magic
        [self.topBar setFrame:(CGRect){self.topBar.frame.origin,self.topBar.frame.size.width,TOP_BAR_MAX - scrollView.contentOffset.y }];
        [self.tableView setFrame:(CGRect){0,self.topBar.frame.size.height,self.view.frame.size.width,self.view.frame.size.height-self.topBar.frame.size.height}];
    }
    
    
    NSLog(@"%f",scrollView.contentOffset.y);
}

@end
