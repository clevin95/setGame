//
//  GameLogic.h
//  MyCardGame
//
//  Created by Carter Levin on 5/25/14.
//  Copyright (c) 2014 Carter Levin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetCard.h"

@interface GameLogic : NSObject

- (BOOL)rightForCard1:(SetCard *)Card1
                Card2:(SetCard *)Card2
                Card3:(SetCard *)Card3
             property:(NSString *)property;

- (BOOL)rightCountForCard1:(SetCard *)Card1
                     Card2:(SetCard *)Card2
                     Card3:(SetCard *)Card3;

- (BOOL)rightSet: (NSArray *)selected;
- (int) cardsInPlay;

@end
