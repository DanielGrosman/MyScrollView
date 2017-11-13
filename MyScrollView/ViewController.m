//
//  ViewController.m
//  MyScrollView
//
//  Created by Daniel Grosman on 2017-11-13.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()

@property (nonatomic) MyScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MyScrollView *scrollView = [[MyScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [scrollView addSubview:redView];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 150, 200)];
    greenView.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:greenView];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(40, 400, 200, 150)];
    blueView.backgroundColor = [UIColor blueColor];
    [scrollView addSubview:blueView];
    
    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 600, 180, 150)];
    yellowView.backgroundColor = [UIColor yellowColor];
    [scrollView addSubview:yellowView];
}


//- (void) viewDidAppear:(BOOL)animated {
//    CGRect newBounds = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height);
//    [self.view setBounds:newBounds];
//}


@end
