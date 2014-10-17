//
//  Photo+Flickr.h
//  Phtomania
//
//  Created by xuzhaocheng on 14-10-16.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import "Photo.h"

@interface Photo (Flickr)
+ (Photo *)photoWithFlickrInfo: (NSDictionary *)photoDictionary
        inManagedObjectContext: (NSManagedObjectContext *)context;

+ (void)loadPhotosFromFlickrArray: (NSArray *)photos
         intoManagedObjectContext: (NSManagedObjectContext *)context;
@end
