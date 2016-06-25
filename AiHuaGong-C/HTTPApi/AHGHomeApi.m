//
//  AHGHomeApi.m
//  AiHuaGong-C
//
//  Created by ap on 16/6/23.
//  Copyright © 2016年 AHG. All rights reserved.
//

#import "AHGHomeApi.h"

@implementation BannerApi
-(NSString*) getPath{
    return @"app=banner&act=index" ;
}

@end

@implementation ShopListApi

-(NSString*) getPath{
    return @"app=recom&act=goods_list" ;
}


@end
@implementation RecondShop

-(NSString*) getPath{
    return @"app=recom&act=store_recom" ;
}

@end

@implementation TimeSales

-(NSString*) getPath{
    return @"app=flash&act=snatch" ;
}


@end