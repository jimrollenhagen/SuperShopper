//
//  NewStoreAlertViewDelegate.m
//  SuperShopper
//
//  Created by Jim Rollenhagen on 7/25/13.
//  Copyright (c) 2013 Jim Rollenhagen. All rights reserved.
//

#import "NewStoreAlertViewDelegate.h"

@implementation NewStoreAlertViewDelegate : NSObject

- (NewStoreAlertViewDelegate *) initWithSender: (id) sender {
    self.sender = sender;
    return self;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSString *text = [alertView textFieldAtIndex:0].text;
    [self.sender insertNewObject:self withName:text];
}

@end