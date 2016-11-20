//
//  UIImageView+remote.h
//  animationLiOSObjc
//
//  Created by James Sadlier on 20/11/2016.
//  Copyright © 2016 James Sadlier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (remote)

- (void) imageFromURL:(NSURL*)imageURL withCompletion:(void(^)(bool success))completion;
- (void) imageFromURL:(NSURL*)imageURL withCompletion:(void(^)(bool success))completion animated:(bool)animated;
@end
