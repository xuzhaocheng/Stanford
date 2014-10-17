//
//  Photographer+Create.m
//  Phtomania
//
//  Created by xuzhaocheng on 14-10-16.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import "Photographer+Create.h"

@implementation Photographer (Create)

+ (Photographer *)photographerWithName: (NSString *)name
                inManagedObjectContext: (NSManagedObjectContext *)context
{
    Photographer *photographer = nil;
    
    if ([name length]) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
        request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
        
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        if (!matches || error || [matches count] > 1) {
            NSLog(@"Error");
        } else if ([matches count]) {
            photographer = [matches firstObject];
        } else {
            photographer = [NSEntityDescription insertNewObjectForEntityForName:@"Photographer"
                                                         inManagedObjectContext:context];
            photographer.name = name;
        }
    }
    
    return photographer;
}

@end
