//
//  JAViewController.m
//  JAButton
//
//  Created by 312846421@qq.com on 01/10/2018.
//  Copyright (c) 2018 312846421@qq.com. All rights reserved.
//

#import "JAViewController.h"
#import "JAButton.h"
#import "UIView+JAFrame.h"


@interface JAViewController ()

@end

@implementation JAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat btnH = 150;
    CGFloat btnW = 150;
    CGFloat btnLeftMargin = 5;
    NSInteger maxTypeCount = 13; // JAButtonType 的个数
    
    CGFloat descLBX = btnLeftMargin + btnW;
    CGFloat descLBW = self.view.frame.size.width - descLBX;
    CGFloat descLBH = btnH;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, maxTypeCount * (btnH + btnLeftMargin));
    [self.view addSubview:scrollView];
    
    for (int i = 0; i < maxTypeCount; i++) {
        
        JAButton *button = [JAButton JAButtonWithType:i spacing:12];
        //button property set up
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        button.titleLabel.backgroundColor = [UIColor darkGrayColor];
        button.backgroundColor = [UIColor lightGrayColor];
        button.frame = CGRectMake(btnLeftMargin, i * (btnH + btnLeftMargin), btnW, btnH);
        [button setTitle:@"douyu" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"AppIcon60x60"] forState:UIControlStateNormal];
        
        //set up unReadDotImageV
        [button makeDotImageSetUpVBlock:^(UIImageView *dotImageV) {
            dotImageV.hidden = NO;
            dotImageV.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1];
        }];
        button.ja_dotAlignment = i % JAButtonUnreadDotImageAlignmentRightBottom; //JAButtonUnreadDotImageAlignmentRightBottom 枚举最大值
        button.ja_dotImageInsets = UIEdgeInsetsMake(5, 5, 5, 5);
        [scrollView addSubview:button];
        
        
        // make description LB
        CGFloat descLBY = button.ja_y;
        UILabel *descLB = [[UILabel alloc] initWithFrame:CGRectMake(descLBX, descLBY, descLBW, descLBH)];
        descLB.numberOfLines = 0;
        descLB.textAlignment = NSTextAlignmentCenter;
        descLB.font = [UIFont systemFontOfSize:10];
        descLB.text = [self jaButtonEnumTypeStringFromIndex:button.ja_type];
        [scrollView addSubview:descLB];
        
    }
	
}

- (NSString *)jaButtonEnumTypeStringFromIndex:(JAButtonType)buttonType {
    switch (buttonType) {
            //Horizontal 水平居中
        case JAButtonTypeHorizontalCenterImageLabel:
            return @"JAButtonTypeHorizontalCenterImageLabel \n默认样式 水平居中 左 imageV 右 label";
            break;
        case JAButtonTypeHorizontalCenterLabelImage:
            return @"JAButtonTypeHorizontalCenterLabelImage \n水平居中 左 label 右 imageV";
            break;
        case JAButtonTypeHorizontalLeftImageLabel:
            return @"JAButtonTypeHorizontalLeftImageLabel \n 水平靠左 左 imageV 右 label";
            break;
        case JAButtonTypeHorizontalLeftLabelImage:
            return @"JAButtonTypeHorizontalLeftLabelImage \n 水平靠左 左 label 右 imageV";
            break;
        case JAButtonTypeHorizontalRightImageLabel:
            return @"JAButtonTypeHorizontalRightImageLabel \n 水平靠右 左 imageV 右 label";
            break;
        case JAButtonTypeHorizontalRightLabelImage:
            return @"JAButtonTypeHorizontalRightLabelImage \n 水平靠右 左 label 右 imageV";
            break;
            
            //Vertical 垂直居中
        case JAButtonTypeVerticalCenterImageLabel:
            return @"JAButtonTypeVerticalCenterImageLabel \n 垂直居中 左 imageV 右 label";
            break;
        case JAButtonTypeVerticalCenterLabelImage:
            return @"JAButtonTypeVerticalCenterLabelImage \n 垂直居中 左 label 右 imageV";
            break;
        case JAButtonTypeVerticalTopImageLabel:
            return @"JAButtonTypeVerticalTopImageLabel \n 垂直靠上 上 imageV 下 label";
            break;
        case JAButtonTypeVerticalTopLabelImage:
            return @"JAButtonTypeVerticalTopLabelImage \n 垂直靠上 上 label 下 imageV";
            break;
        case JAButtonTypeVerticalBottomImageLabel:
            return @"JAButtonTypeVerticalBottomImageLabel \n 垂直靠下 上 imageV 下 label";
            break;
        case JAButtonTypeVerticalBottomLabelImage:
            return @"JAButtonTypeVerticalBottomLabelImage \n 垂直靠下 上 label 下 imageV";
            break;
            
            //VerticalLeft 垂直居中靠左
        case JAButtonTypeVerticalCenterLeftImageLabel:
            return @"JAButtonTypeVerticalCenterLeftImageLabel \n 垂直居中靠左 上 imageV 下 label";
            break;
            
        default:
            return @"没对上号~~";
            break;
    }
}

@end
