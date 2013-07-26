//
//  ShopperStore.h
//  SuperShopper
//
//  Created by Jim Rollenhagen on 7/25/13.
//  Copyright (c) 2013 Jim Rollenhagen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopperStore : NSObject

@property (strong, nonatomic) NSString *name;

+ (id) initWithName : (NSString*) name;

@end
