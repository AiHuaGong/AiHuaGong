
#import "AHGHomeHeaderView.h"
#import "JXBAdPageView.h"
#import "Utile.h"
@implementation AHGHomeHeaderView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        [self setViewAction];
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return self;
}

-(void)setViewAction{
    JXBAdPageView * JXView = [[JXBAdPageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 120)];
    JXView.iDisplayTime = 2.0;
    //    JXView.delegate = self;
    [JXView startAdsWithBlock:@[@"interesting_card",@"interesting_person",@"interesting_card",@"interesting_person"] block:^(NSInteger clickIndex){
        NSLog(@"%d",(int)clickIndex);
    }];
    [self addSubview:JXView];
    CGFloat margent = 10;
    CGFloat width = 60;
    //类型按钮
    UIView * buttonview = [[UIView alloc]init];
    buttonview.backgroundColor = [UIColor whiteColor];
    [self addSubview:buttonview];
    NSArray * arr = @[@"抢购",@"商品",@"指数",@"客服"];
    CGFloat f = (self.frame.size.width - width * 4) / 5;
    
    for (int i = 0; i < 4; i++) {
        UIButton * bu = [[UIButton alloc]init];
        bu.tag = i;
        [bu addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [bu setTitle:[NSString stringWithFormat:@"%@",arr[i]] forState:UIControlStateNormal];
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
    
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"interesting_person"]];
    imageView.frame = CGRectMake(0, CGRectGetMinY(label.frame) + 1, 120, 25);
    [buttonview addSubview:imageView];
    //跑马灯label
    UILabel *Slabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + 2 , CGRectGetMinY(imageView.frame), self.frame.size.width - imageView.frame.size.width + 30, 25)];
    Slabel.font = [UIFont systemFontOfSize:13];
//    Slabel.backgroundColor = [UIColor yellowColor];
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
  buttonview.frame = CGRectMake(0, CGRectGetMaxY(JXView.frame) + margent, CGRectGetWidth(self.frame), CGRectGetMaxY(imageView.frame) + 2);
    
    
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actiondo)];
//    [tapGesture setNumberOfTouchesRequired:1];
    Slabel.userInteractionEnabled = YES;
    [Slabel addGestureRecognizer:tapGesture];
    
    //推荐供应商页面
    UIView * shopVIew = [[UIView alloc]init];
    shopVIew.backgroundColor = [UIColor whiteColor];
    [self addSubview:shopVIew];
    shopVIew.frame = CGRectMake(0, CGRectGetMaxY(buttonview.frame) + margent, self.frame.size.width, 50);
    UIImageView * iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"A-iocn"]];
    iconView.frame = CGRectMake(margent, 13, 24, 24);
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
    [bu setImage:[UIImage imageNamed:@"my_revise"] forState:UIControlStateNormal];
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

//- (void)setWebImage:(UIImageView *)imgView imgUrl:(NSString *)imgUrl {
//    [imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
//}

@end
