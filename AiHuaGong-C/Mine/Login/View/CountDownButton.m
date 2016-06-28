//
//  CountDownButton.m
//  Top9
//
//  Created by admin on 14/12/9.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "CountDownButton.h"


@interface CountDownButton()
{
    NSTimer * _countDownTimer;
}

@property (nonatomic,assign)NSInteger count;
@property (nonatomic,strong)NSString * stopCountDownTitle;
@end

@implementation CountDownButton

- (void)dealloc{
    
    NSLog(@"%@ release",self.class);
    
    [_countDownTimer invalidate];
    _countDownTimer = nil;
    
    self.startCountDownColor = nil;
    self.stopCountDownColor = nil;
    
    self.stopCountDownTitle = nil;
}

- (void)stopCountDown{
    
    if (_countDownTimer) {
        [_countDownTimer invalidate];
        _countDownTimer = nil;
    }
    self.count = 0;
    self.enabled = YES;
    self.backgroundColor = self.stopCountDownColor;
    
    if (!self.stopCountDownTitle) {
        return;
    }
    [self setTitle:self.stopCountDownTitle forState:UIControlStateNormal];
}

- (void)startCountDown{
    if (_countDownTimer) {
        return;
    }
    
    self.stopCountDownTitle = self.titleLabel.text;
    
    self.enabled = NO;
    
    self.backgroundColor = self.startCountDownColor;
    self.count = 60;
    [self setTitle:[NSString stringWithFormat:@"已发送(%ld)",(long)self.count] forState:UIControlStateNormal];
    _countDownTimer  = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(beginCountdown) userInfo:0 repeats:YES];
    
}

//倒计时
- (void)beginCountdown{
    
    if (self.count ==0) {
        [_countDownTimer invalidate];
        _countDownTimer = nil;
        
        self.enabled = YES;
        self.backgroundColor = self.stopCountDownColor;
        [self setTitle:self.stopCountDownTitle forState:UIControlStateNormal];
        return;
    }
    self.count--;
    [self setTitle:[NSString stringWithFormat:@"已发送(%ld)",(long)self.count] forState:UIControlStateNormal];
    
}

@end
