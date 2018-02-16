//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "Pizza.h"
#import "ManagersWhoAreCheery.h"
#import "ManagersWhoHateAnchovies.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        ManagersWhoAreCheery *happyGuy = [ManagersWhoAreCheery new];
        ManagersWhoHateAnchovies *grumpyGuy = [ManagersWhoHateAnchovies new];
        
        while (TRUE) {
            // Loop forever
            
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            
            NSString *sizeString = commandWords.firstObject;
            
            
            BOOL validSize = [restaurantKitchen isValidPizzaSize: sizeString];
            
            if (!validSize) {
                NSLog(@"The size you entered, \"%@,\" is not available.", sizeString);
                continue;
            }
//            NSRange range = NSMakeRange(1, commandWords.count - 1);
            
            NSArray *arrayWithOnlyToppings = [[NSArray alloc]init];
            for (int i = 1; i < commandWords.count ; i++) {
                arrayWithOnlyToppings = [arrayWithOnlyToppings arrayByAddingObject: commandWords[i]];
            }
            
            NSLog(@"Pick your manager: happyGuy, grumpyGuy, or no manager");
            
            NSLog(@"> ");
            char mgr[100];
            fgets (mgr, 100, stdin);
            
            NSString *manager = [[NSString alloc] initWithUTF8String:mgr];
            manager = [manager stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"You chose %@", manager);
            
            if ([manager isEqualToString:@"happyGuy"]) {
                restaurantKitchen.delegate = happyGuy;
            } else if ([manager isEqualToString:@"grumpyGuy"]) {
                restaurantKitchen.delegate = grumpyGuy;
            } else {
                restaurantKitchen.delegate = nil;
            }
            
            
            
            
            // And then send some message to the kitchen...
            Pizza *newPizza = [restaurantKitchen makePizza: [restaurantKitchen setEnumSizeFromString:sizeString] toppings:arrayWithOnlyToppings];
            
            // Checks the size and toppings of this newPizza that has been initiated
            NSLog(@"Here is a %@ pizza with the following toppings:",[newPizza size]);
            NSLog(@"%@",[newPizza getToppings]);
        }

    }
    return 0;
}

