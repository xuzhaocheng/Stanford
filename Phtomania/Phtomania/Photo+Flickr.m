//
//  Photo+Flickr.m
//  Phtomania
//
//  Created by xuzhaocheng on 14-10-16.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import "Photo+Flickr.h"
#import "Photographer+Create.h"
#import "FlickrFetcher.h"

@implementation Photo (Flickr)

+ (Photo *)photoWithFlickrInfo: (NSDictionary *)photoDictionary
        inManagedObjectContext: (NSManagedObjectContext *)context
{
    Photo *photo = nil;
    
    NSString *unique = photoDictionary[FLICKR_PHOTO_ID];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", unique];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    if (!matches || error || [matches count] > 1) {
        NSLog(@"Error");
    } else if ([matches count]) {
        photo = [matches firstObject];
    } else {
        photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo"
                                              inManagedObjectContext:context];
        photo.unique = unique;
        photo.title = [photoDictionary valueForKeyPath:FLICKR_PHOTO_TITLE];
        photo.subtitle = [photoDictionary valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
        photo.imageURL = [[FlickrFetcher URLforPhoto:photoDictionary format:FlickrPhotoFormatLarge] absoluteString];
        
        photo.whoTook = [Photographer photographerWithName:photoDictionary[FLICKR_PHOTO_OWNER]
                                    inManagedObjectContext:context];
    }
    
    return photo;
}

+ (void)loadPhotosFromFlickrArray: (NSArray *)photos
         intoManagedObjectContext: (NSManagedObjectContext *)context
{
    
}

@end
