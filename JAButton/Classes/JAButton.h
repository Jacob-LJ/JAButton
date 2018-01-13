//
//  JAButton.h
//  JAButton_Example
//
//  Created by Jacob_Liang on 2018/1/10.
//  Copyright © 2018年 312846421@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JAButtonType) {
    JAButtonTypeHorizontalCenterImageLabel,
    JAButtonTypeHorizontalCenterLabelImage,
    JAButtonTypeHorizontalLeftImageLabel,
    JAButtonTypeHorizontalLeftLabelImage,
    JAButtonTypeHorizontalRightImageLabel,
    JAButtonTypeHorizontalRightLabelImage,
    
    JAButtonTypeVerticalCenterImageLabel,
    JAButtonTypeVerticalCenterLabelImage,
    JAButtonTypeVerticalTopImageLabel,
    JAButtonTypeVerticalTopLabelImage,
    JAButtonTypeVerticalBottomImageLabel,
    JAButtonTypeVerticalBottomLabelImage,
    
    JAButtonTypeVerticalCenterLeftImageLabel,
};

typedef NS_ENUM(NSUInteger, JAButtonUnreadDotImageAlignment) {
    JAButtonUnreadDotImageAlignmentRightTop,
    JAButtonUnreadDotImageAlignmentLeftTop,
    JAButtonUnreadDotImageAlignmentRightBottom,
    JAButtonUnreadDotImageAlignmentLeftBottom,
};

@interface JAButton : UIButton

@property (nonatomic, assign) JAButtonType ja_type;
@property (nonatomic, assign) IBInspectable CGFloat ja_imageLabelSpacing;
@property (nonatomic, assign) IBInspectable CGFloat ja_minCenterMargin;

@property (nonatomic, assign) CGFloat ja_horizontalCenterX;

@property (nonatomic, strong) UIImage *ja_normalImage;
@property (nonatomic, strong) UIImage *ja_selectedImage;

@property (nonatomic, strong) NSAttributedString *ja_normalAttributeString;
@property (nonatomic, copy) NSString *ja_normalTitle;
@property (nonatomic, copy) NSString *ja_selectedTitle;

@property (nonatomic, strong) UIColor *ja_normalTitleColor;
@property (nonatomic, strong) UIColor *ja_selectedTitleColor;

//未读标签图
//dotImageV default is hidden, default size is 10*10
- (void)makeDotImageSetUpVBlock:(void (^)(UIImageView *dotImageV))dotImageVSetUpBlock;

@property (nonatomic, assign) JAButtonUnreadDotImageAlignment ja_dotAlignment;
@property (nonatomic, assign) UIEdgeInsets ja_dotImageInsets;



+ (instancetype)JAButtonWithType:(JAButtonType)type spacing:(CGFloat)spacing;

@end
