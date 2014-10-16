//
//  AppDelegate+MOC.m
//  Photomania
//
//  Created by xuzhaocheng on 14-10-16.
//  Copyright (c) 2014年 louis. All rights reserved.
//

#import "AppDelegate+MOC.h"

@implementation AppDelegate (MOC)

- (NSManagedObjectContext *)createManagedObjectContext
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsDirectory = [[fileManager URLsForDirectory:NSDocumentationDirectory
                                                     inDomains:NSUserDomainMask] firstObject];
    NSString *documentName = @"PhotographerData";
    NSURL *url = [documentsDirectory URLByAppendingPathComponent:documentName];
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];
    return document.managedObjectContext;
}

@end
