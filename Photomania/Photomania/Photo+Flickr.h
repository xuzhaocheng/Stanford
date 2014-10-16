//
//  Photo+Flickr.h
//  Photomania
//
//  Created by xuzhaocheng on 14-10-16.
//  Copyright (c) 2014年 louis. All rights reserved.
//

#import "Photo.h"

@interface Photo (Flickr)

+ (Photo *)photoWithFlickrInfo:(NSDictionary *)photoDictionary
         inManageObjectContext:(NSManagedObjectContext *)context;

+ (void)loadPhotosFromFlickrArray:(NSArray *)array
             inMangeObjectContext:(NSManagedObjectContext *)context;

@end
