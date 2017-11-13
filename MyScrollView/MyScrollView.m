//
//  MyScrollView.m
//  MyScrollView
//
//  Created by Daniel Grosman on 2017-11-13.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "MyScrollView.h"

@interface MyScrollView ()

@property (nonatomic) UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation MyScrollView

- (instancetype)initWithCoder:(NSCoder *)Coder
{
    self = [super initWithCoder:Coder];
    if (self) {
        _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewWasPanned:)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:_panGestureRecognizer];
    }
    return self;
}



- (void)viewWasPanned:(UIPanGestureRecognizer *) sender {
    
    self.contentSize = CGSizeMake(300,750);
    CGPoint translationInView = [sender translationInView:self];
    CGFloat y = translationInView.y - self.lastLocation.y;
    
    if (self.frame.origin.y + y >= [[UIScreen mainScreen] bounds].size.height - self.frame.size.height && self.frame.origin.y + y <= 0) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + y, 300, 750);
    }
    
    self.lastLocation = translationInView;
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        self.lastLocation = CGPointMake(0, 0);
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
