//
//  STPersistence.h
//  STKit
//
//  Created by SunJiangting on 13-12-8.
//  Copyright (c) 2013年 SunJiangting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <STKit/Foundation+STKit.h>

typedef enum {
    STPersistenceDirectoryDocument,  // document 目录
    STPersistenceDirectoryLibiary,   // Libiary  目录
    STPersistenceDirectoryTemporary, // 临时目录
} STPersistenceDirectory;

extern NSString *STPersistDocumentDirectory();
extern NSString *STPersistLibiaryDirectory();
extern NSString *STPersistTemporyDirectory();

@interface STPersistence : NSObject

+ (BOOL)persistValue:(id)value intoDirectory:(STPersistenceDirectory)directory forKey:(NSString *)key;

+ (id)valueForPersistKey:(NSString *)key inDirectory:(STPersistenceDirectory)directory;

@end

/// 调用 setValue:forKey 就可以 存储了, valueForKey可以取
@interface STPersistence (STUserDefault)

+ (instancetype)standardPerstence;

+ (void)resetStandardPerstence;
/// 删除key
- (id)removeValueForKey:(NSString *)key;

@end