
#import "BaseModel.h"
//推荐商家model
@interface ReShopModel : BaseModel

@property(nonatomic, strong)NSString * store_logo;
@property(nonatomic, strong)NSString * store_name;
@property(nonatomic) NSInteger storeid;
@end

//轮播图moel
@interface BanModel : BaseModel

@property(nonatomic)NSInteger ban_id;
@property(nonatomic, strong)NSString * ban_link;
@property(nonatomic, strong)NSString * ban_src;

@end