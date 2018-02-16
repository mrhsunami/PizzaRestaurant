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

+ (enum PizzaSize) setEnumSizeFromString: (NSString *) userInput {
    NSString *lowercasedUserInputSize = userInput.lowercaseString;
    if ([lowercasedUserInputSize isEqualToString:@"small"]) {
        return small;
    } else if ([lowercasedUserInputSize isEqualToString:@"medium"]) {
        return medium;
    } else if ([lowercasedUserInputSize isEqualToString:@"large"]) {
        return large;
    }
    else {
        return small;
    }
}

- (NSString *) size {
    switch (self.pizzaSize) {
        case small: {
            return @"Small";
        }
        case medium: {
            return @"Medium";
        }
        case large: {
            return @"Large";
        }
    }
}

- (NSString *) getToppings {
    NSString *arrayItems = [NSString stringWithFormat:@"%@", self.toppings];
    return arrayItems;
}

@end


