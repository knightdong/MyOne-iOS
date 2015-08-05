//
//  HTTPTool.m
//  MyOne
//
//  Created by HelloWorld on 8/3/15.
//  Copyright (c) 2015 melody. All rights reserved.
//

#import "HTTPTool.h"

@implementation HTTPTool

+ (AFHTTPRequestOperationManager *) initAFHttpManager {
	static AFHTTPRequestOperationManager *manager;
	static dispatch_once_t once;
	dispatch_once(&once, ^{
		manager = [[AFHTTPRequestOperationManager alloc] init];
		manager.responseSerializer = [AFJSONResponseSerializer serializer];
		manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
		manager.operationQueue.maxConcurrentOperationCount = 1;
	});
	
	return manager;
}

/**
 *  获取首页数据
 *
 *  @param date    日期，"yyyy-MM-dd"格式
 *  @param success 请求成功 Block
 *  @param fail     请求失败 Block
 */
+ (void)requestHomeContentByDate:(NSString *)date  success:(SuccessBlock)success failBlock:(FailBlock)fail {
	AFHTTPRequestOperationManager *manager = [HTTPTool initAFHttpManager];
	NSDictionary *parameters = @{@"strDate" : date, @"strRow" : @"1"};
	[manager GET:URL_GET_HOME_CONTENT parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
		success(operation,responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		fail(operation,error);
	}];
}

/**
 *  获取文章
 *
 *  @param date    日期，"yyyy-MM-dd"格式
 *  @param success 请求成功 Block
 *  @param fail     请求失败 Block
 */
+ (void)requestReadingContentByDate:(NSString *)date  success:(SuccessBlock)success failBlock:(FailBlock)fail {
	
}

/**
 *  获取问题
 *
 *  @param date    日期，"yyyy-MM-dd"格式
 *  @param success 请求成功 Block
 *  @param fail     请求失败 Block
 */
+ (void)requestQuestionContentByDate:(NSString *)date  success:(SuccessBlock)success failBlock:(FailBlock)fail {
	
}

/**
 *  获取东西
 *
 *  @param date    日期，"yyyy-MM-dd"格式
 *  @param success 请求成功 Block
 *  @param fail     请求失败 Block
 */
+ (void)requestThingContentByDate:(NSString *)date  success:(SuccessBlock)success failBlock:(FailBlock)fail {
	AFHTTPRequestOperationManager *manager = [HTTPTool initAFHttpManager];
	NSDictionary *parameters = @{@"strDate" : date, @"strRow" : @"1"};
	[manager GET:URL_GET_THING_CONTENT parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
		success(operation,responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		fail(operation,error);
	}];
}

@end
