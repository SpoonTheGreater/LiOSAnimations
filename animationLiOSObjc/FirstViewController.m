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
    [self setUpTableView];
}

- (void)setUpTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
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


@end
