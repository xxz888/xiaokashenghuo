
#import "GRcyRifxy_UZ.h"
#import "AFHTTPSessionManager.h"


#import <MJExtension/MJExtension.h>

@implementation GRcyRifxy_UZ


+ (NSData *)pomposityChoreography:(CGFloat)maxLimit images:(UIImage *)image{
    
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.2f; 
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    NSInteger imageDataLength = [imageData length];
    while ((imageDataLength <= maxLimit * 1000 * 1000) && (compression >= maxCompression)) {
        compression -= 0.03;
        imageData = UIImageJPEGRepresentation(image, compression);
        imageDataLength = [imageData length];
    }
    return imageData;
}




+ (UIImage *)realmIdeology:(UIImage *)image{
    float imageWidth = image.size.width;
    float imageHeight = image.size.height;
    float width = 640;
    float height = image.size.height/(image.size.width/width);
    float widthScale = imageWidth /width;
    float heightScale = imageHeight /height;
    
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    if (widthScale > heightScale) {
        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
    }
    else {
        [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
    }
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return newImage;
}
#pragma mark 字典转化字符串

+ (NSString*)flusterDivergeUnreasonable:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}



+ (void)PostWithImageURL:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock __nullable)success failure:(FailureBlock __nullable)failure{
    
    url = [ApiUrl stringByAppendingString:url];
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *UserData = [standardDefaults objectForKey:@"UserData"];
    if (UserData != nil) {
        UIImage *image = params[@"file"];
 
        AFHTTPSessionManager * sessionManager = [AFHTTPSessionManager manager];
        
        sessionManager.requestSerializer.timeoutInterval = 20;
        
        sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json",@"text/html", nil];
        
        [sessionManager.requestSerializer setValue:UserData[@"token"] forHTTPHeaderField:@"token"];
        [sessionManager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"platform"];
        
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString  *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        [sessionManager.requestSerializer setValue:app_Version forHTTPHeaderField:@"version"];
        
        [sessionManager POST:url parameters:nil headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSString * fileName = [NSString stringWithFormat:@"sfz.jpg"];
            
            NSData *data = [self pomposityChoreography:0.2 images:[self realmIdeology:image]];
            [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:@"image/jpeg"];
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
            NSLog(@"上传完成比率：%f",uploadProgress.fractionCompleted * 100);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSError * err = nil;
            
            NSString *result =[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSData * datas = [result dataUsingEncoding:NSUTF8StringEncoding];
            NSMutableDictionary * data= [NSJSONSerialization JSONObjectWithData:datas options:0 error:&err];
            
            success(data);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(@"服务未响应,请重试！");
        }];
        
    }
    
}


+ (void)PostWithAddressURL:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock __nullable)success failure:(FailureBlock __nullable)failure{
    
    
    url = [ApiUrl stringByAppendingString:url];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *UserData = [standardDefaults objectForKey:@"UserData"];
    if(UserData != nil){
        
        [manager.requestSerializer setValue:UserData[@"token"] forHTTPHeaderField:@"token"];
    }
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"platform"];
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString  *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    [manager.requestSerializer setValue:app_Version forHTTPHeaderField:@"version"];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain",nil];

    [manager POST:url parameters:params headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if(responseObject != nil){
                if ([[responseObject allKeys] containsObject:@"status"]) {
                    if ([responseObject[@"status"] intValue] == 500){
                        failure(@"服务器无响应");
                        return;
                    }
                }

                NSString * receiveStr = [[self flusterDivergeUnreasonable:responseObject] stringByReplacingOccurrencesOfString:@"null" withString:@"\"\""];
                NSData * datas = [receiveStr dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary * dataDic = [NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingMutableLeaves error:nil];
                
                success(dataDic);
            }else{
                failure(@"服务器无响应");
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(@"服务器无响应");
        }];
    
}


+ (void)PostWithURL:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock __nullable)success failure:(FailureBlock __nullable)failure{
    
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                 @"text/html",
                                                 @"text/json",
                                                 @"text/javascript",
                                                 @"text/plain",
                                                 nil];
    manager.responseSerializer = responseSerializer;
    
    url = [ApiUrl stringByAppendingString:url];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:nil error:nil];

    request.timeoutInterval= 20;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *UserData = [standardDefaults objectForKey:@"UserData"];
    if(UserData != nil){
        
        [request setValue:UserData[@"token"] forHTTPHeaderField:@"token"];
    }
    [request setValue:@"ios" forHTTPHeaderField:@"platform"];
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString  *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    [request setValue:app_Version forHTTPHeaderField:@"version"];
    
    
    [request setHTTPBody:[params mj_JSONData]];
    
    
    [[manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse *response,id responseObject,NSError *error){
        
        
        if(responseObject != nil ){
            
            NSString *str1 = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            
            NSString * receiveStr = [str1 stringByReplacingOccurrencesOfString:@"null" withString:@"\"\""];
            
            NSData * datas = [receiveStr dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary * dataDic = [NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingMutableLeaves error:nil];
            if ([[dataDic allKeys] containsObject:@"status"]) {
                if ([dataDic[@"status"] intValue] == 500){
                    failure(@"服务器无响应");
                    return;
                }
            }
            
            success(dataDic);
        }else{
            failure(@"服务器无响应");
        }
    }]resume];
}

@end
