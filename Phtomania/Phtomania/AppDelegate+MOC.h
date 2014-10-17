//
//  AppDelegate+MOC.h
//  Phtomania
//
//  Created by xuzhaocheng on 14-10-16.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (MOC)
- (NSManagedObjectContext *)createManageObjectContext;
@end
