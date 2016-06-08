//
//  ChanFMDBHelper.m
//  ChanDB
//
//  Created by 陈世翰 on 16/5/6.
//  Copyright © 2016年 Chan. All rights reserved.
//
#import <objc/runtime.h>

#import "ChanFMDBHelper.h"
#import "ChanFMDBModel.h"

@interface ChanFMDBHelper ()
///**
// *   <#decr#>
// */
//@property (nonatomic,strong)FMDatabaseQueue *dbQeue;

@end

@implementation ChanFMDBHelper

static ChanFMDBHelper *_instance = nil;

+(ChanFMDBHelper *)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _instance = [[self alloc] init];
    });
    return _instance;
}
//Handle with the path of db
+(NSString *)dbPathWithDirectoryName:(NSString *)directoryName{
    NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (directoryName == nil || directoryName.length == 0) {
        docsDir = [docsDir stringByAppendingPathComponent:@"ChanDefaultDB"];
    }else{
        docsDir = [docsDir stringByAppendingPathComponent:directoryName];
    }
    BOOL isDir;
    BOOL exit = [fileManager fileExistsAtPath:docsDir isDirectory:&isDir];
    if (!exit || !isDir) {
        [fileManager createDirectoryAtPath:docsDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *dbPath = [docsDir stringByAppendingPathComponent:@"chandb.sqlite"];
    return dbPath;
}

//return cur dbPath
+(NSString *)dbPath
{
    return [[self class] dbPathWithDirectoryName:nil];
}

- (FMDatabaseQueue *)dbQueue
{
    if (_dbQueue == nil) {
        _dbQueue = [[FMDatabaseQueue alloc] initWithPath:[self.class dbPath]];
    }
    return _dbQueue;
}

- (BOOL)changeDBWithDirectoryName:(NSString *)directoryName
{
    if (_instance.dbQueue) {
        _instance.dbQueue = nil;
    }
    _instance.dbQueue = [[FMDatabaseQueue alloc] initWithPath:[ChanFMDBHelper dbPathWithDirectoryName:directoryName]];
    
    int numClasses;
    Class *classes = NULL;
    numClasses = objc_getClassList(NULL,0);
    
    if (numClasses >0 )
    {
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        for (int i = 0; i < numClasses; i++) {
            if (class_getSuperclass(classes[i]) == [ChanFMDBModel class]){
                id class = classes[i];
                [class performSelector:@selector(createTable) withObject:nil];
            }
        }
        free(classes);
    }
    
    return YES;
}

@end
