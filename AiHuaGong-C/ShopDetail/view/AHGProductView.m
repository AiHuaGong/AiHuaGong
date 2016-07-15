
#import "AHGProductView.h"

@implementation AHGProductView

-(id)initWithImage:(UIImage*)image money:(NSString*)money name:(NSString*)name{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UIFont * font =[UIFont systemFontOfSize:14];
        CGFloat dis = (VIEW_WIDTH - 2*MARGENT_DIS)/ 3;
        UIImageView * imview = [[UIImageView alloc]initWithImage:image];
        [self addSubview:imview];
        imview.frame = CGRectMake(0, 0, dis, dis);
        
        UILabel * moneyLabel = [[UILabel alloc]init];
        moneyLabel.text = money;
        moneyLabel.frame = CGRectMake(0, dis, dis, 20);
        moneyLabel.textColor = [UIColor redColor];
        moneyLabel.font = font;
        
        moneyLabel.textAlignment = NSTextAlignmentCenter;
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(moneyLabel.frame), dis, 20)];
        nameLabel.text = name;
        nameLabel.font = font;
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:nameLabel];
        [self addSubview:moneyLabel];
        self.frame = CGRectMake(0, 0, dis, CGRectGetMaxY(nameLabel.frame) + MARGENT_DIS);
  
    }

    return self;

}

@end
