

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
//获取类的属性名称，以通过反射对对象的属性赋值。
- (NSArray *)PropertyKeys;

+(instancetype) initWithJSON:(id) json;
+(instancetype) emptyInstance ;
@end
