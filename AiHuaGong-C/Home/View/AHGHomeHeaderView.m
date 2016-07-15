
#import "AHGHomeHeaderView.h"
#import "Utile.h"
@implementation AHGHomeHeaderView
-(id)initWithFrame:(CGRect)frame Array:(NSMutableArray*)arr showBelow:(BOOL)bol{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self.banArr = arr;
        [self setViewAction:bol];
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return self;
}
- (void)setWebImage:(UIImageView *)imgView imgUrl:(NSString *)imgUrl {
    [imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
}

-(void)setViewAction:(BOOL)bol{
    _JXView = [[JXBAdPageView alloc] init];
    _JXView.frame =CGRectMake(0, 0, CGRectGetWidth(self.frame), 0);
    _JXView.iDisplayTime = 2.0;
    _JXView.contentMode = UIViewContentModeScaleAspectFill;
    _JXView.delegate = self;
    _JXView.bWebImage = YES;
    NSMutableArray * picarray = [NSMutableArray array];
    for (BanModel * list in _banArr) {
        NSString * str = [NSString stringWithFormat:@"%@%@",BASE_HEADER,list.ban_src];
        [picarray addObject:str];
    }
    if (picarray.count > 0) {
        _JXView.frame =CGRectMake(0, 0, CGRectGetWidth(self.frame), 120);
        [_JXView startAdsWithBlock:picarray block:^(NSInteger clickIndex){
            BanModel *model = [_banArr objectAtIndex:clickIndex];
            if ([self.delegate respondsToSelector:@selector(BannerPicClicked:)]) {
                [self.delegate BannerPicClicked:model.ban_id];
            }
            
        }];
    }
    
    [self addSubview:_JXView];
    CGFloat margent = 10;
    CGFloat width = 60;
    //类型按钮
    UIView * buttonview = [[UIView alloc]init];
    buttonview.backgroundColor = [UIColor whiteColor];
    [self addSubview:buttonview];
    NSArray * arr = @[@"抢购",@"商品",@"指数",@"客服"];
#warning 这里若是旺铺详情的headerview需要修改对应的文字和图片，现在太杂 实在不想改。确定再弄
    if (bol == NO) {
        
    }
    CGFloat f = (self.frame.size.width - width * 4) / 5;
    
    for (int i = 0; i < 4; i++) {
        UIButton * bu = [[UIButton alloc]init];
        bu.tag = i;
        [bu addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [bu setBackgroundImage: [UIImage imageNamed:[NSString stringWithFormat:@"%@",arr[i]]] forState:UIControlStateNormal];
        [buttonview addSubview:bu];
        bu.frame = CGRectMake(f*(i+1) + width*i, margent, width, width);
        [bu setTintColor:[UIColor blackColor]];
        bu.backgroundColor = [UIColor redColor];
        bu.layer.cornerRadius = bu.frame.size.height / 2;
        bu.clipsToBounds = YES;
        UILabel * la = [[UILabel alloc]init];
        la.text = [NSString stringWithFormat:@"%@",arr[i]];
        [buttonview addSubview:la];
        la.frame = CGRectMake(f*(i+1) + width*i, margent*2 + width, width, 20);
        la.textAlignment = NSTextAlignmentCenter;
        la.font = [UIFont systemFontOfSize:16];
        
    }
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, margent*3 + width + 20, self.frame.size.width, 0.5)];
    label.backgroundColor = [UIColor lightGrayColor];
    [buttonview addSubview:label];
    if (bol == NO) {
        label.backgroundColor = [UIColor clearColor];
        buttonview.frame = CGRectMake(0, CGRectGetMaxY(_JXView.frame) + margent, CGRectGetWidth(self.frame), width + 20 +margent * 3);
        self.frame = CGRectMake(0, 0, self.frame.size.width, CGRectGetMaxY(buttonview.frame));
//        buttonview.backgroundColor = [UIColor whiteColor];
        return;
    }

    
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"化工焦点"]];
    imageView.frame = CGRectMake(8, CGRectGetMinY(label.frame) + 5, imageView.image.size.width, imageView.image.size.height);
    [buttonview addSubview:imageView];
    
    //跑马灯label
    UILabel *Slabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + 2 , CGRectGetMinY(imageView.frame) - 4, self.frame.size.width - imageView.frame.size.width + 30, 25)];
//    Slabel.backgroundColor = [UIColor yellowColor];
    Slabel.font = [UIFont systemFontOfSize:13];
    Slabel.textColor = [UIColor redColor];
    Slabel.text = @"噜啦啦噜啦啦噜啦噜啦噜，噜啦噜啦噜啦噜啦噜啦噜~~~";
    [buttonview addSubview:Slabel];
    CGRect frame = Slabel.frame;
    frame.origin.x = CGRectGetMaxX(imageView.frame) ;
    Slabel.frame = frame;
    [UIView beginAnimations:@"testAnimation" context:NULL];
    [UIView setAnimationDuration:5.8f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:999999];
    frame = Slabel.frame;
    frame.origin.x = self.frame.size.width;
    Slabel.frame = frame;
    [UIView commitAnimations];
  buttonview.frame = CGRectMake(0, CGRectGetMaxY(_JXView.frame) + margent, CGRectGetWidth(self.frame), CGRectGetMaxY(imageView.frame) + 2);
    
    
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actiondo)];
//    [tapGesture setNumberOfTouchesRequired:1];
    Slabel.userInteractionEnabled = YES;
    [Slabel addGestureRecognizer:tapGesture];
    
    //推荐供应商页面
    UIView * shopVIew = [[UIView alloc]init];
    shopVIew.backgroundColor = [UIColor whiteColor];
    [self addSubview:shopVIew];
    shopVIew.frame = CGRectMake(0, CGRectGetMaxY(buttonview.frame) + margent, self.frame.size.width, 50);
    UIImageView * iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"荐"]];
//    iconView.adjustsImageWhenAncestorFocused = YES;
    iconView.frame = CGRectMake(margent, 15, 21, 21);
    [shopVIew addSubview:iconView];
    UILabel * desLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(iconView.frame), 0, 120, CGRectGetHeight(shopVIew.frame))];
    desLabel.textAlignment = NSTextAlignmentCenter;
    desLabel.text = @"供应商推荐";
    [shopVIew addSubview:desLabel];
    desLabel.font = [UIFont systemFontOfSize:18];
    UIButton * bu = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - 120, 0, 120 - margent, CGRectGetHeight(shopVIew.frame))];
    [shopVIew addSubview:bu];
    [bu setTitle:@"我要供货" forState:UIControlStateNormal];
    bu.titleLabel.font = [UIFont systemFontOfSize:16];
    [bu setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [bu addTarget:self action:@selector(showProduct) forControlEvents:UIControlEventTouchUpInside];
    [bu setImage:[UIImage imageNamed:@"三角"] forState:UIControlStateNormal];
    CGFloat labelWidth = [Utile sizeWithString:bu.titleLabel.text font:[UIFont systemFontOfSize:16]].width;
    CGFloat imageWith = bu.imageView.bounds.size.width;
    bu.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + 15, 0, -labelWidth);
    bu.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWith, 0, imageWith);
    
    self.frame = CGRectMake(0, 0, self.frame.size.width, CGRectGetMaxY(shopVIew.frame)+ margent);
    
    
    
}
-(void)showProduct{
    if ([self.delegate respondsToSelector:@selector(productButtonClicked)]) {
        [self.delegate productButtonClicked];
    }
}
-(void)Actiondo{
    NSLog(@"查看广告");
}

-(void)buttonClicked:(UIButton*)button{
//    NSLog(@"点击了第%ld个按钮",(long)button.tag);
    if ([self.delegate respondsToSelector:@selector(clickedButtonWithTag:)]) {
        [self.delegate clickedButtonWithTag:button.tag];
    }

}
-(void)dealloc{
    [_JXView stopAds];
}

@end
