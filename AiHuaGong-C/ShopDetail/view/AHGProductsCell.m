
#import "AHGProductsCell.h"
@interface AHGProductsCell()
@property (nonatomic , strong) UIImageView *picView;
@property (nonatomic , strong) UILabel *nameLabel;
@property (nonatomic , strong) UILabel *moneyLabel;
@end
@implementation AHGProductsCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageShow = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:imageShow];
        _picView = imageShow;
        
        UILabel *labelShow = [[UILabel alloc] initWithFrame:CGRectZero];
        labelShow.font = [UIFont systemFontOfSize:13];
        //        labelShow.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:labelShow];
        labelShow.textAlignment = NSTextAlignmentLeft;
        _nameLabel = labelShow;
        
        UILabel * money = [[UILabel alloc]init];
        money.textColor = [UIColor redColor];
        money.font = [UIFont systemFontOfSize:15];
        money.textAlignment = NSTextAlignmentLeft;
        money.text = @"$ 4500";
        [self.contentView addSubview:money];
        _moneyLabel = money;
        self.contentView.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _picView.frame = CGRectMake(0, 0, (VIEW_WIDTH - MARGENT_DIS* 3) / 3, (VIEW_WIDTH - MARGENT_DIS* 3) / 3);
    _moneyLabel.frame = CGRectMake(MARGENT_DIS, (VIEW_WIDTH - MARGENT_DIS* 3) / 3 + 5, (VIEW_WIDTH - MARGENT_DIS* 3) /3 - MARGENT_DIS , 15);
    _nameLabel.frame = CGRectMake(MARGENT_DIS, (VIEW_WIDTH - MARGENT_DIS* 3) / 3 + 20 + 3,(VIEW_WIDTH - MARGENT_DIS* 3) / 3 - MARGENT_DIS,15);
    
}

- (void)setImageName : (NSString *)imageName content : (NSString *)content{
    _picView.image = [UIImage imageNamed:imageName];
    _nameLabel.text = content;
}

@end
