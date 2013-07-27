//
//  MasterViewController.h
//  SuperShopper
//
//  Created by Jim Rollenhagen on 7/25/13.
//  Copyright (c) 2013 Jim Rollenhagen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) UIAlertView *storeAlert;

- (void)insertNewObject:(id)sender withName:(NSString*) name dbRecord:(id) dbRecord insertToDropbox: (BOOL) insertToDropbox;

@end
