//
//  FlickrPhotosTableViewController.m
//  Shutterbug
//
//  Created by xuzhaocheng on 14-10-11.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import "FlickrPhotosTableViewController.h"
#import "FlickrFetcher.h"
#import "ImageViewController.h"

@interface FlickrPhotosTableViewController ()

@end

@implementation FlickrPhotosTableViewController

- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    [self.tableView reloadData];
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.photos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Flickr Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    
    NSDictionary *photo = self.photos[indexPath.row];
    
    cell.textLabel.text = [photo valueForKeyPath:FLICKR_PHOTO_TITLE];
    cell.detailTextLabel.text = [photo valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
    
    return cell;
}



#pragma mark - Navigation

- (void)prepareImageViewController:(ImageViewController *)ivc toDisplayPhoto:(NSDictionary *)photo
{
    ivc.imageURL = [FlickrFetcher URLforPhoto:photo format:FlickrPhotoFormatLarge];
    ivc.title = [photo valueForKeyPath:FLICKR_PHOTO_TITLE];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if ([segue.identifier isEqualToString:@"Show Flickr Photo"]) {
            if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
                [self prepareImageViewController:segue.destinationViewController
                                  toDisplayPhoto:self.photos[indexPath.row]];
            }
        }
    }
    
}


@end
