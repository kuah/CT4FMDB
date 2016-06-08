//
//  ChanFMDBModel.h
//  ChanDB
//
//  Created by 陈世翰 on 16/5/6.
//  Copyright © 2016年 Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
/** SQLite五种数据类型 */
#define SQLTEXT     @"TEXT"
#define SQLINTEGER  @"INTEGER"
#define SQLREAL     @"REAL"
#define SQLBLOB     @"BLOB"
#define SQLNULL     @"NULL"

@interface ChanFMDBModel : NSObject
/** 列名 */
@property (retain, readonly, nonatomic) NSMutableArray         *columeNames;
/** 列类型 */
@property (retain, readonly, nonatomic) NSMutableArray         *columeTypes;

/**
 *  获取该类的所有属性
 */
+ (NSDictionary *)getPropertys;

/** 获取所有属性，包括主键 */
+ (NSDictionary *)getAllProperties;


/** 数据库中是否存在表 */
+ (BOOL)isExistInTable;

/** 表中的字段*/
+ (NSArray *)getColumns;

/**表的主键（必须******）*********/
+(NSString *)primaryKey;

///获取总条数
+(NSInteger)getCountByCriteria:(NSString *)criteria;;

/** 保存或更新
 * 如果不存在主键，保存，
 * 有主键，则更新
 */
- (BOOL)saveOrUpdate;

/** 保存单个数据 */
- (BOOL)save;
/** 批量保存数据 */
+ (BOOL)saveObjects:(NSArray *)array;
/** 更新单个数据 */
- (BOOL)update;
/** 批量更新数据*/
+ (BOOL)updateObjects:(NSArray *)array;
/** 删除单个数据 */
- (BOOL)deleteObject;
/** 批量删除数据 */
+ (BOOL)deleteObjects:(NSArray *)array;
/** 通过条件删除数据 */
+ (BOOL)deleteObjectsByCriteria:(NSString *)criteria;
/** 通过条件删除 (多参数）--2 */
+ (BOOL)deleteObjectsWithFormat:(NSString *)format, ...;
/** 清空表 */
+ (BOOL)clearTable;

/** 查询全部数据 */
+ (NSArray *)findAll;

/** 通过主键查询 */
+ (instancetype)findByPK:(id)pk;

+ (instancetype)findFirstWithFormat:(NSString *)format, ...;

/** 查找某条数据 */
+ (instancetype)findFirstByCriteria:(NSString *)criteria;

+ (NSArray *)findWithFormat:(NSString *)format, ...;

/** 通过条件查找数据
 * 这样可以进行分页查询 @" WHERE pk > 5 limit 10"
 */
+ (NSArray *)findByCriteria:(NSString *)criteria;
/**
 * 创建表
 * 如果已经创建，返回YES
 */
+ (BOOL)createTable;

#pragma mark - must be override method
/** 如果子类中有一些property不需要创建数据库字段，那么这个方法必须在子类中重写
 */
+ (NSArray *)transients;

@end
