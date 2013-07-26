//
//  ShopperStore.m
//  SuperShopper
//
//  Created by Jim Rollenhagen on 7/25/13.
//  Copyright (c) 2013 Jim Rollenhagen. All rights reserved.
//

#import "ShopperStore.h"

@interface ShopperStore() {
}

@end

@implementation ShopperStore

+ (id) initWithName : (NSString*) name {
    ShopperStore *store = [ShopperStore alloc];
    store.name = name;
    return store;
}

@end
