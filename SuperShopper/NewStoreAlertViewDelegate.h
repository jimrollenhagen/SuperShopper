//
//  NewStoreAlertViewDelegate.h
//  SuperShopper
//
//  Created by Jim Rollenhagen on 7/25/13.
//  Copyright (c) 2013 Jim Rollenhagen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MasterViewController.h"

@interface NewStoreAlertViewDelegate : NSObject

@property (strong, nonatomic) MasterViewController *sender;

- (NewStoreAlertViewDelegate *) initWithSender: (id) sender;

@end
