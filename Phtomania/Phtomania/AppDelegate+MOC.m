//
//  AppDelegate+MOC.m
//  Phtomania
//
//  Created by xuzhaocheng on 14-10-16.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import "AppDelegate+MOC.h"

@implementation AppDelegate (MOC)

- (NSManagedObjectContext *)createManageObjectContext
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *url = [[fileManager URLsForDirectory:NSDocumentationDirectory
                                     inDomains:NSUserDomainMask] firstObject];
    
    url = [url URLByAppendingPathComponent:@"coreData"];
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];
    return document.managedObjectContext;
}

@end
