//
//  ViewController.m
//  CT4FMDBDemo
//
//  Created by 陈世翰 on 16/6/8.
//  Copyright © 2016年 chan. All rights reserved.
//

#import "ViewController.h"
#import "ChanModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    for (int i = 0; i<30; i++) {
        ChanModel *model =[[ChanModel alloc]init];
        model.Id = @(i+1);
        model.Name = [NSString stringWithFormat:@"陈小翰%d",(int)i+1];
        model.sex = @(i%2 == 0);
        [model saveOrUpdate];
    }
        NSArray *a = [ChanModel findByCriteria:@"WHERE sex=1" Page:1 PageSize:3];
       NSArray * arr =[ChanModel findAll];
        for (ChanModel *model in arr) {
            NSLog(@"%@",model.description);
        }
        NSLog(@"%ld",arr.count);
        
    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
