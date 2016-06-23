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

@implementation ReShopApi

-(NSString*) getPath{
    return @"app=recom&act=index" ;
}


@end