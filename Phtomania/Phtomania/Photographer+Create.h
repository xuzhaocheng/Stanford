//
//  Photographer+Create.h
//  Phtomania
//
//  Created by xuzhaocheng on 14-10-16.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import "Photographer.h"

@interface Photographer (Create)
+ (Photographer *)photographerWithName: (NSString *)name
                inManagedObjectContext: (NSManagedObjectContext *)context;
@end
