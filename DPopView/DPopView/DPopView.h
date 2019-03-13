//
//  DPopView.h
//  DPopView
//
//  Created by Destiny on 2019/3/13.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ShowAnimationStyle_Detafult,
    ShowAnimationStyle_fromBottom,
    ShowAnimationStyle_fromTop,
    ShowAnimationStyle_fromLeft,
    ShowAnimationStyle_fromRight,
} ShowAnimationStyle;

typedef enum : NSUInteger {
    HideAnimationStyle_Detafult,
    HideAnimationStyle_toBottom,
    HideAnimationStyle_toTop,
    HideAnimationStyle_toLeft,
    HideAnimationStyle_toRight,
} HideAnimationStyle;


NS_ASSUME_NONNULL_BEGIN

@interface DPopView : UIView<CAAnimationDelegate>

//contentView
@property(nonatomic,strong) UIView *contentView;
//default is YES
@property(nonatomic,assign) BOOL userTouchActionEnable;
//default is PKShowAnimationStyle_Detafult
@property(nonatomic,assign) ShowAnimationStyle showAnimationStyle;

//default is PKHideAnimationStyle_Detafult
@property(nonatomic,assign) HideAnimationStyle hideAnimationStyle;

-(void)showOnView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
