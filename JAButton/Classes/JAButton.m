//
//  JAButton.m
//  JAButton_Example
//
//  Created by Jacob_Liang on 2018/1/10.
//  Copyright © 2018年 312846421@qq.com. All rights reserved.
//

#import "JAButton.h"
#import "UIView+JAFrame.h"

@interface JAButton ()

@property (nonatomic, weak) UIImageView *dotImageV;

@end

@implementation JAButton

+ (instancetype)JAButtonWithType:(JAButtonType)type spacing:(CGFloat)spacing {
    JAButton *button = [self buttonWithType:UIButtonTypeCustom];
    button.ja_type = type;
    button.ja_imageLabelSpacing = spacing;
    return button;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setUpInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit {
    
    _ja_imageLabelSpacing = 0;
    _ja_type = JAButtonTypeHorizontalCenterImageLabel;
    [self setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    
    UIImageView *dotImageV = [[UIImageView alloc] init];
    //default
    dotImageV.hidden = YES;
    dotImageV.backgroundColor = [UIColor redColor];
    dotImageV.bounds = CGRectMake(0, 0, 10, 10);
    dotImageV.layer.cornerRadius = 5;
    dotImageV.clipsToBounds = YES;
    [self addSubview:dotImageV];
    self.dotImageV = dotImageV;
    
    
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (!self.userInteractionEnabled) return nil;
    
    if ([self pointInside:point withEvent:event]) return self;
    
    return [super hitTest:point withEvent:event];
}

- (void)setHighlighted:(BOOL)highlighted {}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    self.imageView.center = CGPointMake(self.ja_width * 0.5, self.ja_height * 0.5);
    self.titleLabel.center = CGPointMake(self.ja_width * 0.5, self.ja_height * 0.5);
    
    if (self.ja_type == JAButtonTypeHorizontalCenterImageLabel) {
        
        CGFloat maxLabelWidth = self.ja_width - self.imageView.ja_width - self.ja_imageLabelSpacing - 2 * self.ja_minCenterMargin + 0.1;
        self.titleLabel.ja_width = MIN(maxLabelWidth, self.titleLabel.ja_width);
        self.imageView.ja_x = (self.ja_width - self.imageView.ja_width - self.ja_imageLabelSpacing - self.titleLabel.ja_width) * 0.5;
        if (self.ja_horizontalCenterX) {
            self.imageView.ja_x = self.ja_horizontalCenterX;
        }
        self.titleLabel.ja_x = self.imageView.ja_right + self.ja_imageLabelSpacing;
        
    } else if (self.ja_type == JAButtonTypeHorizontalCenterLabelImage) {
        
        CGFloat maxLabelWidth = self.ja_width - self.imageView.ja_width - self.ja_imageLabelSpacing - 2 * self.ja_minCenterMargin + 0.1;
        self.titleLabel.ja_width = MIN(maxLabelWidth, self.titleLabel.ja_width);
        self.titleLabel.ja_x = (self.ja_width - self.imageView.ja_width - self.ja_imageLabelSpacing - self.titleLabel.ja_width) * 0.5;
        self.imageView.ja_x = self.titleLabel.ja_right + self.ja_imageLabelSpacing;
        
    } else if (self.ja_type == JAButtonTypeHorizontalLeftImageLabel) {
        
        self.imageView.ja_x = 0;
        self.titleLabel.ja_x = self.imageView.ja_right + self.ja_imageLabelSpacing;
        
    } else if (self.ja_type == JAButtonTypeHorizontalLeftLabelImage) {
        
        self.titleLabel.ja_x = 0;
        self.imageView.ja_x = self.titleLabel.ja_right + self.ja_imageLabelSpacing;
        
    } else if (self.ja_type == JAButtonTypeHorizontalRightImageLabel) {
        
        self.imageView.ja_x = self.ja_width - self.imageView.ja_width;
        self.titleLabel.ja_x = self.imageView.ja_x - self.ja_imageLabelSpacing - self.titleLabel.ja_width;
        
    } else if (self.ja_type == JAButtonTypeHorizontalRightLabelImage) {
        
        self.titleLabel.ja_x = self.ja_width - self.titleLabel.ja_width;
        self.imageView.ja_x = self.titleLabel.ja_x - self.ja_imageLabelSpacing - self.imageView.ja_width;
        
    } else if (self.ja_type == JAButtonTypeVerticalCenterImageLabel) {
        
        CGFloat maxLabelWidth = self.ja_width - 2 * self.ja_minCenterMargin + 0.1;
        self.titleLabel.ja_width = MIN(maxLabelWidth, self.titleLabel.ja_width);
        self.imageView.ja_y = (self.ja_height - self.ja_imageLabelSpacing - self.imageView.ja_height - self.titleLabel.ja_height) * 0.5;
        self.titleLabel.ja_y = self.imageView.ja_bottom + self.ja_imageLabelSpacing;
        
    } else if (self.ja_type == JAButtonTypeVerticalCenterLabelImage) {
        
        CGFloat maxLabelWidth = self.ja_width - 2 * self.ja_minCenterMargin + 0.1;
        self.titleLabel.ja_width = MIN(maxLabelWidth, self.titleLabel.ja_width);
        self.titleLabel.ja_y = (self.ja_height - self.ja_imageLabelSpacing - self.imageView.ja_height - self.titleLabel.ja_height) * 0.5;
        self.imageView.ja_y = self.titleLabel.ja_bottom + self.ja_imageLabelSpacing;
        
    } else if (self.ja_type == JAButtonTypeVerticalTopImageLabel) {
        
        self.imageView.ja_y = 0;
        self.titleLabel.ja_y = self.imageView.ja_bottom + self.ja_imageLabelSpacing;
        
    } else if (self.ja_type == JAButtonTypeVerticalTopLabelImage) {
        
        self.titleLabel.ja_y = 0;
        self.imageView.ja_y = self.titleLabel.ja_bottom + self.ja_imageLabelSpacing;
        
    } else if (self.ja_type == JAButtonTypeVerticalBottomImageLabel) {
        
        self.imageView.ja_y = self.ja_height - self.imageView.ja_height;
        self.titleLabel.ja_y = self.imageView.ja_y - self.ja_imageLabelSpacing - self.titleLabel.ja_height;
        
    } else if (self.ja_type == JAButtonTypeVerticalBottomLabelImage) {
        
        self.titleLabel.ja_y = self.ja_height - self.titleLabel.ja_height;
        self.imageView.ja_y = self.titleLabel.ja_y - self.ja_imageLabelSpacing - self.imageView.ja_height;
        
    } else if (self.ja_type == JAButtonTypeVerticalCenterLeftImageLabel) {
        
        CGFloat maxLabelWidth = self.ja_width - 2 * self.ja_minCenterMargin + 0.1;
        self.titleLabel.ja_width = MIN(maxLabelWidth, self.titleLabel.ja_width);
        self.imageView.ja_y = (self.ja_height - self.ja_imageLabelSpacing - self.imageView.ja_height - self.titleLabel.ja_height) * 0.5;
        self.titleLabel.ja_y = self.imageView.ja_bottom + self.ja_imageLabelSpacing;
        
        self.imageView.ja_x = 0;
        self.titleLabel.ja_centerX = self.imageView.ja_centerX;
    }
    
    //handle dotImageV frame
    switch (self.ja_dotAlignment) {
        case JAButtonUnreadDotImageAlignmentRightTop: {
            
            self.dotImageV.ja_top = self.imageView.ja_top + self.ja_dotImageInsets.top;
            self.dotImageV.ja_right = self.imageView.ja_right - self.ja_dotImageInsets.right;
            break;
        }
        case JAButtonUnreadDotImageAlignmentLeftTop: {
            self.dotImageV.ja_top = self.imageView.ja_top + self.ja_dotImageInsets.top;
            self.dotImageV.ja_left = self.imageView.ja_left + self.ja_dotImageInsets.left;
            break;
        }
        case JAButtonUnreadDotImageAlignmentRightBottom: {
            self.dotImageV.ja_bottom = self.imageView.ja_bottom - self.ja_dotImageInsets.bottom;
            self.dotImageV.ja_right = self.imageView.ja_right - self.ja_dotImageInsets.right;
            break;
        }
        case JAButtonUnreadDotImageAlignmentLeftBottom: {
            self.dotImageV.ja_bottom = self.imageView.ja_bottom - self.ja_dotImageInsets.bottom;
            self.dotImageV.ja_left = self.imageView.ja_left + self.ja_dotImageInsets.left;
            break;
        }
    }
    
}

- (void)setJa_type:(JAButtonType)ja_type {
    _ja_type = ja_type;
    [self layoutSubviews];
}

- (void)setJa_imageLabelSpacing:(CGFloat)ja_imageLabelSpacing {
    _ja_imageLabelSpacing = ja_imageLabelSpacing;
    [self layoutSubviews];
}

- (void)setJa_normalImage:(UIImage *)ja_normalImage {
    [self setImage:ja_normalImage forState:UIControlStateNormal];
}

- (UIImage *)ja_normalImage {
    return [self imageForState:UIControlStateNormal];
}

- (void)setJa_selectedImage:(UIImage *)ja_selectedImage {
    [self setImage:ja_selectedImage forState:UIControlStateSelected];
}

- (UIImage *)ja_selectedImage {
    return [self imageForState:UIControlStateSelected];
}


- (void)setJa_normalTitle:(NSString *)ja_normalTitle {
    [self setTitle:ja_normalTitle forState:UIControlStateNormal];
}

- (NSString *)ja_normalTitle {
    return [self titleForState:UIControlStateNormal];
}

- (void)setJa_normalAttributeString:(NSAttributedString *)ja_normalAttributeString {
    [self setAttributedTitle:ja_normalAttributeString forState:UIControlStateNormal];
}

- (NSAttributedString *)ja_normalAttributeString {
    return [self attributedTitleForState:UIControlStateNormal];
}

- (void)setJa_selectedTitle:(NSString *)ja_selectedTitle {
    [self setTitle:ja_selectedTitle forState:UIControlStateSelected];
}

- (NSString *)ja_selectedTitle {
    return [self titleForState:UIControlStateSelected];
}

- (void)setJa_normalTitleColor:(UIColor *)ja_normalTitleColor {
    [self setTitleColor:ja_normalTitleColor forState:UIControlStateNormal];
}

- (UIColor *)ja_normalTitleColor {
    return [self titleColorForState:UIControlStateNormal];
}

- (void)setJa_selectedTitleColor:(UIColor *)ja_selectedTitleColor {
    [self setTitleColor:ja_selectedTitleColor forState:UIControlStateSelected];
}

- (UIColor *)ja_selectedTitleColor {
    return [self titleColorForState:UIControlStateSelected];
}

- (void)makeDotImageSetUpVBlock:(void (^)(UIImageView *))dotImageVSetUpBlock {
    if (dotImageVSetUpBlock) {
        dotImageVSetUpBlock(self.dotImageV);
    }
}

@end
