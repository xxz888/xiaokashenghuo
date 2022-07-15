
#import "ETZo_MController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LXZtjte_qController : ETZo_MController



- (NSDictionary *)loadUserData;
- (void)updateUserData:(NSDictionary *)data;
- (NSDictionary *)loadSuperMembersData;
- (void)updateSuperMembersData:(NSDictionary *)data;

- (NSDictionary *)getToObtainTheSpecified:(NSString *)key;
- (void)updateToObtainTheSpecified:(NSString *)key Data:(NSDictionary *)data;


- (BOOL)RealNameAuthentication;
- (BOOL)CameraPermissions;

- (void)登陆过期;

- (BOOL)toLogin;

#pragma 冒泡排序 大的在前
- (void)setBubbleSortArray:(NSMutableArray *)dataArr FieldString:(NSString *)fieldStr;


- (BOOL)isEmpty:(id)object;


#pragma mark - 获取单次定位地址
- (void)addLocationManager:(void(^)(NSString *province,NSString *city))backname;


- (void)getAddressThan:(NSString *)province City:(NSString *)city isThan:(void(^)(NSString *provinceCode,NSString *cityCode,BOOL isThan))backname;




- (float)randomBetween:(float)smallNum AndBigNum:(float)bigNum AndPrecision:(NSInteger)precision;

@end

NS_ASSUME_NONNULL_END
