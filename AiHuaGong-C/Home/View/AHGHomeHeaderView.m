
#import "AHGHomeHeaderView.h"
#import "JXBAdPageView.h"
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
    
    
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actiondo:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [Slabel addGestureRecognizer:tapGesture];
    
}
-(void)Actiondo:(id)sender{
    NSLog(@"查看广告");
}

-(void)buttonClicked:(UIButton*)button{
    NSLog(@"点击了第%ld个按钮",(long)button.tag);
    if ([self.delegate respondsToSelector:@selector(clickedButtonWithTag:)]) {
        [self.delegate clickedButtonWithTag:button.tag];
    }

}

//- (void)setWebImage:(UIImageView *)imgView imgUrl:(NSString *)imgUrl {
//    [imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
//}

@end
