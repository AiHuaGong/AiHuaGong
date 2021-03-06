
#import "BaseApi.h"

@implementation BaseApi
/*
 测试服务器：http://192.168.0.116/ios.php?
 */
-(enum METHOD) getMethod{
    return GET ;
}
-(NSString*) getAddressHome{
    return @"http://192.168.0.116/ios.php?" ;
}
-(NSString*) getPath{
    return @"";
}
-(NSDictionary*) getParam{
    NSArray* propertys = [self PropertyKeys] ;
    NSMutableDictionary* dict = [NSMutableDictionary dictionary] ;
    for (NSString* key in propertys) {
        if ([self valueForKey:key]) {
            [dict setObject:[self valueForKey:key] forKey:key];
        }
        
    }
    return dict ;
}
-(NSArray*) getFileArray{
    return [NSMutableArray array] ;
}
-(void) excuteWhithSuccess:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    session.responseSerializer=[AFJSONResponseSerializer serializer] ;
    session.requestSerializer.timeoutInterval = 30;
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSString* url = [[self getAddressHome] stringByAppendingString:[self getPath]] ;
    NSDictionary* dict = [self getParam] ;
    if ([self getMethod]==GET) {
        if ([dict count]>0) {
            url = [url stringByAppendingString:@"?"] ;
            for (NSString* key in dict) {
                url = [url stringByAppendingFormat:@"%@=%@&",key,[dict objectForKey:key]];
            }
        }
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"url=%@",url) ;
        [session GET:url parameters:nil success:success failure:failure];
        
    }else{
//        session.requestSerializer=[[BodyAFHTTPRequestSerializer alloc]init] ;
        //[session POST:url parameters:dict success:success failure:failure] ;
        NSArray* fileArray = [self getFileArray] ;
//        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            for (int i =0; i<fileArray.count; i++) {
                NSString* keyfile = [NSString stringWithFormat:@"file%d",i] ;
                NSLog(@"fileName %@",keyfile) ;
                NSString* filePath = [fileArray objectAtIndexedSubscript:i];
                 [formData appendPartWithFileURL:[NSURL fileURLWithPath:filePath] name:@"fileArray" fileName:keyfile mimeType:@"image/jpeg" error:nil];
            }
            for (NSString* key in dict) {
                NSString* value = [NSString stringWithFormat:@"%@",[dict objectForKey:key]] ;
                [formData appendPartWithFormData:[value dataUsingEncoding:NSUTF8StringEncoding] name:key] ;
            }

          
        } error:nil];
        
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        NSURLSessionUploadTask *uploadTask;
        uploadTask = [manager
                      uploadTaskWithStreamedRequest:request
                      progress:nil
                      completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                          if (error) {
                              
                              failure(uploadTask,error) ;
                          } else {
                             
                              success(uploadTask,responseObject);
                          }
                      }];
        
        [uploadTask resume];

    }
    
}
-(void) executeHasParse:(void (^)(id))success failure:(void (^)(NSString *))failure{
    [self excuteWhithSuccess:^(NSURLSessionDataTask *response, id responseDate) {
        NSString* code = [responseDate objectForKey:@"code"];
//        NSLog(@"json=%@",responseDate) ;
        if ([code isEqualToString:@"0"]) {
            success([responseDate objectForKey:@"data"]) ;
        }else{
            failure(@"server error") ;
        }
    } failure:^(NSURLSessionDataTask *response, NSError *error) {
        failure(@"系统出错,请稍后再试~~") ;
    }] ;
}

@end
