//
//  LZXPickerView.m
//  LZXPickerView
//
//  Created by twzs on 16/6/23.
//  Copyright © 2016年 LZX. All rights reserved.
//

#import "LZXPickerView.h"

@interface LZXPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView   *pickerView;
@property (nonatomic, strong) NSArray        *dataArray;
@property (nonatomic, strong) NSMutableArray *provincesArray;
@property (nonatomic, strong) NSMutableArray *selectedArray;
@property (nonatomic, strong) NSMutableArray *cityArray;
@property (nonatomic, strong) NSMutableArray *areaArray;

@end

@implementation LZXPickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addPickerView];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.areaArray.count != 0) {
        self.selectString = [NSString stringWithFormat:@"%@ %@ %@",self.provincesArray[0],self.cityArray[0],self.areaArray[0]];
    } else {
        self.selectString = [NSString stringWithFormat:@"%@ %@",self.provincesArray[0],self.cityArray[0]];
    }
}
-(void)canleClicked:(UIButton*)bu{
    if ([self.delegate respondsToSelector:@selector(choosenStringWithTag:address:)]) {
        [self.delegate choosenStringWithTag:bu.tag address:self.selectString];
    }

}
- (void)addPickerView
{
    UIView* blackGroundView = [[UIView alloc]initWithFrame:self.frame];
    blackGroundView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
    [self addSubview:blackGroundView];
    
    UIView * baseview = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height- 250 - 64, VIEW_WIDTH, 250)];
    baseview.backgroundColor = [UIColor whiteColor];
    [blackGroundView addSubview:baseview];
    
    self.backgroundColor = [UIColor clearColor];
    UIColor * co = [UIColor orangeColor];
    UIButton * cancleButton = [[UIButton alloc]init];
//    cancleButton.backgroundColor =co;
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton setTitleColor:co forState:UIControlStateNormal];
    cancleButton.frame = CGRectMake(0, 0, 120, 50);
    [cancleButton addTarget:self action:@selector(canleClicked:) forControlEvents:UIControlEventTouchUpInside];
    cancleButton.tag = 0;
    [baseview addSubview:cancleButton];
    
    UIButton *sure = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - 120, 0, 120, 50)];
    [baseview addSubview:sure];
    [sure setTitleColor:co forState:UIControlStateNormal];
    [sure addTarget:self action:@selector(canleClicked:) forControlEvents:UIControlEventTouchUpInside];
    [sure setTitle:@"确定" forState:UIControlStateNormal];
    sure.tag = 1;
    
    UILabel * line = [[UILabel alloc]init];
    line.backgroundColor = [UIColor lightGrayColor];
    line.frame = CGRectMake(0, 50, VIEW_WIDTH, 0.5);
    [baseview addSubview:line];
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 51, self.frame.size.width, CGRectGetHeight(baseview.frame)-51)];
    _pickerView.backgroundColor = [UIColor whiteColor];
//    _pickerView
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [baseview addSubview:_pickerView];
    baseview.alpha = 1;
}

-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
        UILabel *myView = nil;
    
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 30)];
        
        myView.textAlignment = NSTextAlignmentCenter;
        NSString * str;
        if (component == 0) {
            str = self.provincesArray[row];
        }else if (component == 1) {
            str = self.cityArray[row];
        }else {
            str = self.areaArray[row];
        }
        myView.text = str;
        myView.font = [UIFont systemFontOfSize:15];         //用label来设置字体大小
        myView.backgroundColor = [UIColor clearColor];
        
   
    return myView;

}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
       return self.provincesArray.count;
    }else if (component == 1) {
        return self.cityArray.count;
    }else {
        return self.areaArray.count;
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        self.selectedArray = self.dataArray[row][@"cities"];
        [self.cityArray removeAllObjects];
        [self.selectedArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.cityArray addObject:obj[@"city"]];
        }];
        self.areaArray = [NSMutableArray arrayWithArray:[self.selectedArray firstObject][@"areas"]];
        [pickerView reloadComponent:1];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }else if (component == 1) {
        if (self.selectedArray.count == 0) {
            self.selectedArray = [self.dataArray firstObject][@"cities"];
        }
        self.areaArray = [NSMutableArray arrayWithArray:[self.selectedArray objectAtIndex:row][@"areas"]];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }
    NSInteger index = [_pickerView selectedRowInComponent:0];
    NSInteger index1 = [_pickerView selectedRowInComponent:1];
    NSInteger index2 = [_pickerView selectedRowInComponent:2];
    if (self.areaArray.count != 0) {
        self.selectString = [NSString stringWithFormat:@"%@-%@-%@",self.provincesArray[index],self.cityArray[index1],self.areaArray[index2]];
    } else {
        self.selectString = [NSString stringWithFormat:@"%@-%@",self.provincesArray[index],self.cityArray[index1]];
    }

}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return self.provincesArray[row];
    }else if (component == 1) {
        return self.cityArray[row];
    }else {
        if (self.areaArray.count != 0) {
            return self.areaArray[row];
        }else {
            return nil;
        }
    }
}
#pragma mark  - 数据源
- (NSArray *)dataArray
{
    if (nil == _dataArray) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"area" ofType:@"plist"];
        _dataArray = [[NSArray alloc]initWithContentsOfFile:path];
    }
    return _dataArray;
}
#pragma mark - 初始化数据  只取第一组
- (NSMutableArray *)provincesArray
{
    if (nil == _provincesArray) {
        _provincesArray = [NSMutableArray array];
        [self.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_provincesArray addObject:obj[@"state"]];
        }];
    }
    return _provincesArray;
}
- (NSMutableArray *)cityArray
{
    if (nil == _cityArray) {
        _cityArray = [NSMutableArray array];
        NSMutableArray *citys = [NSMutableArray arrayWithArray:[self.dataArray firstObject][@"cities"]];
        [citys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_cityArray addObject:obj[@"city"]];
        }];
    }
    return _cityArray;
}
- (NSMutableArray *)areaArray
{
    if (nil == _areaArray) {
        NSMutableArray *citys = [NSMutableArray arrayWithArray:[self.dataArray firstObject][@"cities"]];
        self.areaArray = [NSMutableArray arrayWithArray:[citys firstObject][@"areas"]];
    }
    return _areaArray;
}
- (NSMutableArray *)selectedArray
{
    if (nil == _selectedArray) {
        _selectedArray = [NSMutableArray array];
    }
    return _selectedArray;
}
@end
