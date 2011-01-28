//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Mike Pattee on 1/25/11.
//  Copyright 2011 Cordax Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemDetailViewController;

@interface ItemsViewController : UITableViewController 
	{
	NSMutableArray *possessions;
	ItemDetailViewController *detailViewController;
	}
@property (readwrite, nonatomic, retain) NSMutableArray *possessions;

@end
