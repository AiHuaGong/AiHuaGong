//
//  LZXPickerView.h
//  LZXPickerView
//
//  Created by twzs on 16/6/23.
//  Copyright © 2016年 LZX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZXPickerView;
@protocol LZXPickerViewDelegate <NSObject>

-(void)choosenStringWithTag:(NSInteger)tag address:(NSString*)address;

@end

@interface LZXPickerView : UIView
@property (nonatomic, strong) NSString *selectString;
@property(nonatomic, weak)id<LZXPickerViewDelegate>delegate;
@end
