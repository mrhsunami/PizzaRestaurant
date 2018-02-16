//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(enum PizzaSize)size toppings:(NSArray *)toppings {
    Pizza *newPizza = [[Pizza alloc] initWithSize: size AndToppings:toppings];
    return newPizza;
}

@end
