//
//  ViewController.m
//  DPopView
//
//  Created by Destiny on 2019/3/13.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import "ViewController.h"
#import "DPopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)btn1Action:(UIButton *)sender {
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, 200, 200);
    view.backgroundColor = [UIColor redColor];
    
    DPopView *pop = [[DPopView alloc]init];
    [pop showOnView:view];
}

@end
