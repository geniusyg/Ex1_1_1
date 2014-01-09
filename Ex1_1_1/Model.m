//
//  Model.m
//  Ex1_1_1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Model.h"

@implementation Model

static Model *instance;
+(Model *)sharedModel {
	if(nil == instance) {
		instance = [[Model alloc] init];
	}
	return instance;
}

- (id)init {
	self = [super init];
	if(self) {
 		self.data = [[NSMutableArray alloc] initWithObjects:@"iPhone 6",@"iPad Air", @"MacBook Air", @"MacBook Pro", @"MacBook Pro Retina", @"iMac", @"MacPro", @"IU", nil];
	}
	return self;
}

- (id)productAt:(int)productId {
	return [self.data objectAtIndex:productId];
}

- (int)numberOfProducts {
	return [self.data count];
}

- (void)addProduct:(id)product {
	[self.data addObject:product];
}

- (void)removeProductAt:(int)index {
	[self.data removeObjectAtIndex:index];
}

@end
