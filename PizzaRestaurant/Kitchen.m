//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (BOOL) isValidPizzaSize: (NSString *) hopefullyAValidSizeString {
    NSString *lowercasedUserInputSize = hopefullyAValidSizeString.lowercaseString;
    if ([lowercasedUserInputSize isEqualToString:@"small"]) {
        return YES;
    } else if ([lowercasedUserInputSize isEqualToString:@"medium"]) {
        return YES;
    } else if ([lowercasedUserInputSize isEqualToString:@"large"]) {
        return YES;
    } else {
        return NO;
    }
}

- (enum PizzaSize) setEnumSizeFromString: (NSString *) userInput {
    NSString *lowercasedUserInputSize = userInput.lowercaseString;
    if ([lowercasedUserInputSize isEqualToString:@"small"]) {
        return small;
    } else if ([lowercasedUserInputSize isEqualToString:@"medium"]) {
        return medium;
    } else {
        return large;
    }
}

- (Pizza *)makePizza:(enum PizzaSize)size toppings:(NSArray *)toppings {
//    -(BOOL) kitchen:(Kitchen *)kitchen shouldMakePizzaOFSize: (enum PizzaSize)size andToppings: (NSArray *)toppings;
//    -(BOOL) kitchenShouldUpgradeOrder: (Kitchen *)kitchen;
//    -(void) kitchenDidMakePizza: (Pizza *)pizza; // make this method optional
    
    BOOL shouldMakePizzaOFSize = YES;
    BOOL kitchenShouldUpgradeOrder = NO;
    
    
    if (self.delegate) {
        // call the first two methods first
        shouldMakePizzaOFSize = [self.delegate kitchen:self shouldMakePizzaOFSize:size andToppings:toppings];
        kitchenShouldUpgradeOrder = [self.delegate kitchenShouldUpgradeOrder:self];
    }
    
    if (shouldMakePizzaOFSize) {
        
        enum PizzaSize thisPizzaSize;
        if (kitchenShouldUpgradeOrder) {
            thisPizzaSize = large;
        } else {
            thisPizzaSize = size;
        }
        
        Pizza *newPizza = [[Pizza alloc] initWithSize: thisPizzaSize AndToppings:toppings];
        
        
        if ([self.delegate respondsToSelector: @selector(kitchenDidMakePizza:)] ) {
            [self.delegate kitchenDidMakePizza:newPizza];
        }
        
        
        return newPizza;
    } else {
        return nil;
    }
}

@end
