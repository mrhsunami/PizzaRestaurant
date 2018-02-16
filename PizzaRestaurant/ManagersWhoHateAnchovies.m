//
//  ManagersWhoHateAnchovies.m
//  PizzaRestaurant
//
//  Created by Nathan Hsu on 2018-02-16.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "ManagersWhoHateAnchovies.h"

@implementation ManagersWhoHateAnchovies

-(BOOL) kitchen:(Kitchen *)kitchen shouldMakePizzaOFSize: (enum PizzaSize)size andToppings: (NSArray *)toppings {
    for (id eachTopping in toppings) {
        if ([eachTopping isKindOfClass:[NSString class]]) {
            NSString *worstToppingEver = @"anchovies";
            if ([eachTopping isEqualToString: worstToppingEver]) {
                return NO;
            }
        }
    }
    return YES;
}

-(BOOL) kitchenShouldUpgradeOrder: (Kitchen *)kitchen {
    return NO;
}



@end
