//
//  UIImageView+remote.m
//  animationLiOSObjc
//
//  Created by James Sadlier on 20/11/2016.
//  Copyright © 2016 James Sadlier. All rights reserved.
//

#import "UIImageView+remote.h"
#import "UIImage+color.h"

@implementation UIImageView (remote)

- (void) imageFromURL:(NSURL*)imageURL withCompletion:(void(^)(bool success))completion
{
    self.image = [UIImage imageFromColor:[UIColor colorWithHue:(arc4random()%255 / 255.0) saturation:1 brightness:1 alpha:1]];
    /*__block UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [spinner setCenter:(CGPoint){self.frame.size.width*0.5,self.frame.size.height*0.5}];
    [self addSubview:spinner];
    [spinner startAnimating];*/
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:imageURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              //[spinner stopAnimating];
                                              if (!error)
                                              {
                                                  UIImage *imageResponce = [UIImage imageWithData:data];
                                                  self.image = imageResponce;
                                              }
                                              completion(!error);
                                          }];
    [downloadTask resume];
}

- (void) imageFromURL:(NSURL*)imageURL withCompletion:(void(^)(bool success))completion animated:(bool)animated
{
    __block UIColor *color = [UIColor colorWithHue:(arc4random()%255 / 255.0)  saturation:1 brightness:1 alpha:1];
    self.image = [UIImage imageFromColor:color];
    /*__block UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:spinner];
    [spinner setCenter:(CGPoint){self.frame.size.width*0.5,self.frame.size.height*0.5}];
    [spinner startAnimating];*/
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:imageURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              //[spinner stopAnimating];
                                              if (!error)
                                              {
                                                  UIImage *imageResponce = [UIImage imageWithData:data];
                                                  __block UIView *curtain = [[UIView alloc] initWithFrame:self.bounds];
                                                  [curtain setBackgroundColor:color];
                                                  [self addSubview:curtain];
                                                  [self setImage:imageResponce];
                                                  [UIView animateWithDuration:animated?5:0 animations:^{
                                                      [curtain setAlpha:0];
                                                  } completion:^(BOOL finished) {
                                                      [curtain removeFromSuperview];
                                                  }];
                                              }
                                              completion(!error);
                                          }];
    [downloadTask resume];
}



@end
