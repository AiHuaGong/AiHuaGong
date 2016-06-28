//
//  CountDownButton.h
//  Top9
//
//  Created by admin on 14/12/9.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>


//倒计时按钮
@interface CountDownButton : UIButton


@property (nonatomic,strong) UIColor * startCountDownColor;
@property (nonatomic,strong) UIColor * stopCountDownColor;

- (void)startCountDown; //开始倒计时
- (void)stopCountDown; //停止倒计时
@end
