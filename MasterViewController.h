//
//  MasterViewController.h
//  BrowseOverflow
//
//  Created by Ionut IVAN on 10/10/12.
//  Copyright (c) 2012 Ionut IVAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
