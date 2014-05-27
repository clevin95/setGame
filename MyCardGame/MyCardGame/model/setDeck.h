//
//  setDeck.h
//  MyCardGame
//
//  Created by Carter Levin on 5/25/14.
//  Copyright (c) 2014 Carter Levin. All rights reserved.
//
#import "SetCard.h"
#import <Foundation/Foundation.h>

@interface setDeck : NSObject

@property (strong, nonatomic) NSMutableArray *Cards;
- (void)createDeck;
- (SetCard *)selectRandomCard;

@end
