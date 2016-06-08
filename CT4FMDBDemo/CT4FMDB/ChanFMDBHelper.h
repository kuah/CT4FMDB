//
//  ChanFMDBHelper.h
//  ChanDB
//
//  Created by 陈世翰 on 16/5/6.
//  Copyright © 2016年 Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface ChanFMDBHelper : NSObject
/**
 *   实际上并不是一个真正的队列，只是为了防止在各个线程中对数据库的操作保持同步
 */
@property (nonatomic,strong)FMDatabaseQueue *dbQueue;
+(ChanFMDBHelper *)shareInstance;

+(NSString *)dbPath;

-(BOOL)changeDBWithDirectoryName:(NSString *)directoryName;
@end
