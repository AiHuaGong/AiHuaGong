//
//  AHGHandleCell.h
//  AiHuaGong-C
//
//  Created by ap on 16/6/28.
//  Copyright © 2016年 AHG. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AHGHandleCell;
@protocol AHGHandleCellDelegate <NSObject>

-(void)changeSelectState:(UIButton*)bu;

@end

@interface AHGHandleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UIButton *chooseButton;
@property(nonatomic, weak) id<AHGHandleCellDelegate>delegate;
@end
