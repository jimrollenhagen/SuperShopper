//
//  ShopperStore.h
//  SuperShopper
//
//  Created by Jim Rollenhagen on 7/25/13.
//  Copyright (c) 2013 Jim Rollenhagen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Dropbox/Dropbox.h>

@interface ShopperStore : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) DBRecord *record;

- (id) initWithName : (NSString*) name dbRecord: (DBRecord*) dbRecord;

@end
