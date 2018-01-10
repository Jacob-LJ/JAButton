//
//  JAViewController.m
//  JAButton
//
//  Created by 312846421@qq.com on 01/10/2018.
//  Copyright (c) 2018 312846421@qq.com. All rights reserved.
//

#import "JAViewController.h"
#import "JAButton.h"


@interface JAViewController ()

@end

@implementation JAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JAButton *button = [JAButton JAButtonWithType:JAButtonTypeHorizontalCenterLabelImage spacing:12];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    button.backgroundColor = [UIColor lightGrayColor];
    button.bounds = CGRectMake(0, 0, 150, 20);
    button.center = self.view.center;
    [button setTitle:@"douyu" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"AppIcon60x60"] forState:UIControlStateNormal];
    [self.view addSubview:button];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
