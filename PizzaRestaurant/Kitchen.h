//
//  Kitchen.h
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h" // kitchen needs to know about pizza, but pizza doesn't need to know about Kitchen.

@interface Kitchen : NSObject

- (Pizza *)makePizzaWithSize:(enum PizzaSize)size toppings:(NSArray *)toppings;


@end
