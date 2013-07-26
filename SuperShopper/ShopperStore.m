//
//  ShopperStore.m
//  SuperShopper
//
//  Created by Jim Rollenhagen on 7/25/13.
//  Copyright (c) 2013 Jim Rollenhagen. All rights reserved.
//

#import <Dropbox/Dropbox.h>
#import "ShopperStore.h"

@interface ShopperStore() {
}

@end

@implementation ShopperStore

- (id) initWithName : (NSString*) name dbRecord: (DBRecord*) dbRecord {
    self.name = name;
    self.record = dbRecord;
    return self;
}

@end
