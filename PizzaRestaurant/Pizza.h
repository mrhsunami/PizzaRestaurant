//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by Nathan Hsu on 2018-02-15.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

enum PizzaSize { small, medium, large } PizzaSize;

@interface Pizza : NSObject

// two methods. 1. returns value for size, 2. returns toppings. Use enum for size
// you can't change size of pizza after it is baked
// so these values need to be set when object is created
// need init method that takes size and an array. waht array? an array of toppings. this method will set internal values of the object when initialized.

// in main.m, take text from user, use it to ask kitchen for a pizza.
// example user inputs: small ham pineapple chsse. -> should return Pizza obj. with PizzaSize: small. Toppings array: 🍖, 🍍, and 🧀

// Thoughts?
// Pizza obj needs an exposed init method that can be called by the Kitchen. The init method needs to consider the size(an enum) and toppings(an array)
// then the kitchen will have a reference to the existing pizza, and it's method that calls for a pizza will return it as a Pizza obj.
// the pizza needs two other methods. Why? One returns value for size, the other returns toppings. Ah. just for the some external object like a server to check what is on this new pizza.

// pizza can have no properties cuz it cannot be set after.
- (instancetype)initWithSize:(enum PizzaSize)size AndToppings:(NSArray *)toppings;
- (NSString *) size;
- (NSString *) getToppings;
+ (enum PizzaSize) setEnumSizeFromString: (NSString *) sizeString;





@end
