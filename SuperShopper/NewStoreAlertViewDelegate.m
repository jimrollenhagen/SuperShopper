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

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // cancelled
        return;
    }
    NSString *text = [alertView textFieldAtIndex:0].text;
    [self.sender insertNewObject:self withName:text dbRecord:nil insertToDropbox:YES];
}

@end