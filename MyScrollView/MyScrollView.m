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
    }
    return self;
}

- (void)viewWasPanned:(UIPanGestureRecognizer *) sender {
    
    // sets the point (x,y) after the pan
    CGPoint translation = [sender translationInView:self];
    // creates a rect with the current bounds of the scrollView
    CGRect bounds = self.bounds;
    // creates a float with the difference in Y value between where the pan began and ended
    CGFloat newBoundsOriginY = bounds.origin.y - translation.y;
    //  creates a float with a value of 0
    CGFloat minBoundsOriginY = 0.0;
    // creates a float with a value of the contentSize height (origin +200, defined in the viewController) minues the bounds.size.height (origin size)
    CGFloat maxBoundsOriginY = self.contentSize.height - bounds.size.height;
    // ??
    bounds.origin.y = fmax(minBoundsOriginY, fmin(newBoundsOriginY, maxBoundsOriginY));
    // updates the bounds with the update Y origin
    self.bounds = bounds;
    
    [sender setTranslation:CGPointZero inView:self];
}

@end
