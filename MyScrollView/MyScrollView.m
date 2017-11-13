//
//  MyScrollView.m
//  MyScrollView
//
//  Created by Daniel Grosman on 2017-11-13.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "MyScrollView.h"

@interface MyScrollView ()

@property (nonatomic) UIPanGestureRecognizer *panGesture;

@end

@implementation MyScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewWasPanned:)];
        [self addGestureRecognizer:panGesture];
        
       _contentSize = CGSizeMake(300, 750);
    }
    return self;
}

- (void)viewWasPanned:(UIPanGestureRecognizer *) sender {
// correct method: 1. Calculate the difference between the height of the scrollView and the height of the screen (e.g. let's say it's 100 pts) 2. Allow pan for 100 points (check that the translationInView is less than 100)
CGPoint translation = [sender translationInView:self];
CGFloat y = translation.y - self.lastLocation.y;

if (self.frame.origin.y + y >= [[UIScreen mainScreen] bounds].size.height - self.frame.size.height && self.frame.origin.y + y <= 0) {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + y, 400, 750);
}

self.lastLocation = translation;

if (sender.state == UIGestureRecognizerStateEnded) {
    self.lastLocation = CGPointMake(0, 0);
}
}

@end
