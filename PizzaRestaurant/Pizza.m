//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Nathan Hsu on 2018-02-15.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@interface Pizza()

// Variables that are private
@property (nonatomic) enum PizzaSize pizzaSize;
@property (nonatomic) NSArray *toppings;

@end


@implementation Pizza

- (instancetype)initWithSize:(enum PizzaSize)size AndToppings:(NSArray *)toppings {
    self = [super init];
    if (self) {
        self.pizzaSize = size; // will need to set this when kitchen class calls it and passes in a value
        self.toppings = toppings; // will need to set this when kitchen class calls it and passes in a value
    }
    return self;
}


- (NSString *) size {
    switch (self.pizzaSize) {
        case small: {
            return @"small";
        }
        case medium: {
            return @"medium";
        }
        case large: {
            return @"large";
        }
    }
}

- (NSString *) getToppings {
    NSString *arrayItems = [NSString stringWithFormat:@"%@", self.toppings];
    return arrayItems;
}

@end


