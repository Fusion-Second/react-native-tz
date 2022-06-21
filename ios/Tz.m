#import "Tz.h"

@implementation Tz

RCT_EXPORT_MODULE()

// Example method
// See // https://reactnative.dev/docs/native-modules-ios
// RCT_REMAP_METHOD(multiply,
//                  multiplyWithA:(nonnull NSNumber*)a withB:(nonnull NSNumber*)b
//                  withResolver:(RCTPromiseResolveBlock)resolve
//                  withRejecter:(RCTPromiseRejectBlock)reject)
// {
//   NSNumber *result = @([a floatValue] * [b floatValue]);

//   resolve(result);
// }


RCT_REMAP_METHOD(getTimeZone,
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    @try{
        NSTimeZone *timeZone = [NSTimeZone localTimeZone];
        resolve(timeZone.name);
    }
    @catch(NSException *exception){
    NSMutableDictionary * info = [NSMutableDictionary dictionary];
    [info setValue:exception.name forKey:@"ExceptionName"];
    [info setValue:exception.reason forKey:@"ExceptionReason"];
    [info setValue:exception.userInfo forKey:@"ExceptionUserInfo"];
    NSError *error = [[NSError alloc] initWithDomain:@"Root Detection Module" code:0 userInfo:info];
    reject(@"failed to execute",@"",error);
    }
}



@end
