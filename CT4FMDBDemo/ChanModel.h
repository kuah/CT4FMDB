//
//  ChanModel.h
//  CT4FMDBDemo
//
//  Created by 陈世翰 on 16/6/8.
//  Copyright © 2016年 chan. All rights reserved.
//

#import "ChanFMDBModel.h"

@interface ChanModel : ChanFMDBModel
/**
 *   <#decr#>
 */
@property (nonatomic,assign)NSNumber *Id;

/**
 *   <#decr#>
 */
@property (nonatomic,strong)NSString *Name;
/**
 *
 */
@property (nonatomic,assign)NSNumber *sex;

@end
