//
//  locModel.m
//  Search_Map
//
//  Created by 贝庆 on 16/10/27.
//  Copyright © 2016年 贝庆. All rights reserved.
//

#import "locModel.h"

@implementation locModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
