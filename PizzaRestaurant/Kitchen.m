//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizza:(enum PizzaSize)size toppings:(NSArray *)toppings {
//    -(BOOL) kitchen:(Kitchen *)kitchen shouldMakePizzaOFSize: (enum PizzaSize)size andToppings: (NSArray *)toppings;
//    -(BOOL) kitchenShouldUpgradeOrder: (Kitchen *)kitchen;
//    -(void) kitchenDidMakePizza: (Pizza *)pizza; // make this method optional
    
    BOOL shouldMakePizzaOFSize = [self.delegate kitchen:self shouldMakePizzaOFSize:size andToppings:toppings];
    BOOL kitchenShouldUpgradeOrder = [self.delegate kitchenShouldUpgradeOrder:self];
    
    if (shouldMakePizzaOFSize) {
        
        enum PizzaSize thisPizzaSize;
        if (kitchenShouldUpgradeOrder) {
            thisPizzaSize = large;
        } else {
            thisPizzaSize = size;
        }
        
        Pizza *newPizza = [[Pizza alloc] initWithSize: size AndToppings:toppings];
        [self.delegate kitchenDidMakePizza:newPizza];
        return newPizza;
    } else {
        return nil;
    }
}

@end
