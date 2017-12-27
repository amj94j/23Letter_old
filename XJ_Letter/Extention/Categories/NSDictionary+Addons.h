//
//  NSDictionary+Addons.h
//  XJ_Letter
//
//  Created by apple on 2017/11/23.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Addons)
- (id)noneNullObjectForKey:(id)aKey;

- (id)numberNullObjectForKey:(id)aKey;

- (id)objectOrNilForKey:(id)key;

@end


@interface NSMutableDictionary (Addons)

- (void)setObjectOrNil:(id)object forKey:(id)key;
@end
