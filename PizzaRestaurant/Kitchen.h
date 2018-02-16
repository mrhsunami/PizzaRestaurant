//
//  Kitchen.h
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h" // kitchen needs to know about pizza, but pizza doesn't need to know about Kitchen.

@class Kitchen;
@class Pizza;



@protocol KitchenDelegate

-(BOOL) kitchen:(Kitchen *)kitchen shouldMakePizzaOFSize: (enum PizzaSize)size andToppings: (NSArray *)toppings;
-(BOOL) kitchenShouldUpgradeOrder: (Kitchen *)kitchen;

@optional
-(void) kitchenDidMakePizza: (Pizza *)pizza; // make this method optional

@end



@interface Kitchen : NSObject

- (Pizza *)makePizza:(enum PizzaSize)size toppings:(NSArray *)toppings;

@property (weak, nonatomic) id<KitchenDelegate> delegate;


@end
