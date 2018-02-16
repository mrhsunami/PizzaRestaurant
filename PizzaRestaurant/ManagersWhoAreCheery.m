//
//  ManagersWhoAreCheery.m
//  PizzaRestaurant
//
//  Created by Nathan Hsu on 2018-02-16.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "ManagersWhoAreCheery.h"

@implementation ManagersWhoAreCheery

-(BOOL) kitchen:(Kitchen *)kitchen shouldMakePizzaOFSize: (enum PizzaSize)size andToppings: (NSArray *)toppings {
    return YES;
}

-(BOOL) kitchenShouldUpgradeOrder: (Kitchen *)kitchen {
    return YES;
}

-(void) kitchenDidMakePizza: (Pizza *)pizza {
    NSLog(@"Your beautiful pizza is ready!");
} // conforms to optional method

@end
