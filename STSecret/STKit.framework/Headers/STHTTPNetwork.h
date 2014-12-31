//
//  STHTTPNetwork.h
//  STKit
//
//  Created by SunJiangting on 13-11-25.
//  Copyright (c) 2013年 SunJiangting. All rights reserved.
//

#import <STKit/Foundation+STKit.h>
#import <Foundation/Foundation.h>
#import <STKit/STNetwork.h>

@class STNetworkOperation;
typedef void (^STHTTPNetworkHandler)(STNetworkOperation *operation, id response, NSError *error);
typedef void (^STHTTPSynchronousNetworkHandler)(NSURLResponse *response, id data, NSError *error);

/// default text/json
typedef NS_ENUM(NSInteger, STHTTPResponseDataType) {
    STHTTPResponseDataTypeTextHTML = 0, // 返回类型位HTML text/html
    STHTTPResponseDataTypeTextJSON = 1, // 返回类型位JSON text/json
    STHTTPResponseDataTypeTextXML  = 2  // 返回类型位XML  text/xml
};

typedef NS_OPTIONS(NSInteger, STXMLParseOptions){
    STXMLParseOptionsProcessNamespaces = 1 << 0,
    STXMLParseOptionsReportNamespacePrefixes = 1 << 1,
    STXMLParseOptionsResolveExternalEntities = 1 << 2,
};
/// HTTP类型的网络请求
@interface STHTTPNetwork : STNetwork

@property(nonatomic, copy) NSString *HTTPMethod;
/// 基本参数，最后请求时，会带上这些基本参数，如果key重复，则以后面的为准
@property(nonatomic, copy) NSDictionary *basicParameters;
/// 超时时间
@property(nonatomic, assign) NSTimeInterval timeoutInterval;
@property(nonatomic, assign) NSStringEncoding dataEncoding;
// default text/json
@property(nonatomic, assign) STHTTPResponseDataType dataType;
/// used when dataType is text/json
@property(nonatomic, assign) NSJSONReadingOptions JSONReadingOptions;
/// used when dataType is text/xml
@property(nonatomic, assign) STXMLParseOptions XMLParseOptions;
/// 元素内容的key.默认content
@property(nonatomic, copy) NSString *XMLElementContextKey;

/// url prefix  host/path/method?parameters
- (instancetype)initWithHost:(NSString *)host path:(NSString *)path;

/**
 * @abstract 发送异步网络请求
 *
 * @param    Method     请求的方法，会和设置的host/path 拼接起来
 * @param    HTTPMethod 请求的方式，有POST/GET/PUT/DELETE 等，默认为GET
 * @param    parameters 请求的参数，如果有文件资源，请参考 @see STPostDataItem
 * @param    handlers   请求各个阶段的回调
 *
 * @attention  所有handlers 均会在主线程 回调
 */
- (STNetworkOperation *)sendAsynchronousRequestWithMethod:(NSString *)method
                                               parameters:(NSDictionary *)parameters
                                                  handler:(STHTTPNetworkHandler)handler;

- (STNetworkOperation *)sendAsynchronousRequestWithMethod:(NSString *)method
                                               HTTPMethod:(NSString *)HTTPMethod
                                               parameters:(NSDictionary *)parameters
                                                  handler:(STHTTPNetworkHandler)handler;

/**
 * @abstract 发送同步网络请求
 *
 * @param    Method     请求的方法，会和设置的host/path 拼接起来
 * @param    HTTPMethod 请求的方式，有POST/GET/PUT/DELETE 等，默认为GET
 * @param    parameters 请求的参数，如果有文件资源，请参考 @see STPostDataItem
 * @param    handler    请求结束时的回掉
 *
 * @attention  同步请求会阻塞当前线程，请谨慎使用.@see
 *sendAsynchronousRequestWithURLString:
 */
- (void)sendSynchronousRequestWithMethod:(NSString *)method parameters:(NSDictionary *)params handler:(STHTTPSynchronousNetworkHandler)handler;

- (void)sendSynchronousRequestWithMethod:(NSString *)method
                              HTTPMethod:(NSString *)HTTPMethod
                              parameters:(NSDictionary *)parameters
                                 handler:(STHTTPSynchronousNetworkHandler)handler;
@end
