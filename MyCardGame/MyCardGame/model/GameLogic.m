//
//  GameLogic.m
//  MyCardGame
//
//  Created by Carter Levin on 5/25/14.
//  Copyright (c) 2014 Carter Levin. All rights reserved.
//

#import "GameLogic.h"


@implementation GameLogic

- (BOOL)rightForCard1:(SetCard *)Card1
                Card2:(SetCard *)Card2
                Card3:(SetCard *)Card3
             property:(NSString *)property
{
    int ticker = 0;
    id prop1 = [Card1 valueForKey:property];
    id prop2 = [Card2 valueForKey:property];
    id prop3 = [Card3 valueForKey:property];
    if ([prop1 isEqualToString:prop2]){
        ticker ++;
    }
    if ([prop2 isEqualToString:prop3]){
        ticker ++;
    }
    if ([prop1 isEqualToString:prop3]){
        ticker ++;
    }
    NSLog(@"%@:ticker: %d",property,ticker);
    if (ticker == 1){
        return NO;
    } else{
        return YES;
    }
}

- (BOOL)rightCountForCard1:(SetCard *)Card1
                Card2:(SetCard *)Card2
                Card3:(SetCard *)Card3
{
    int ticker = 0;
    if (Card1.count == Card2.count){
        ticker ++;
    }
    if (Card1.count == Card3.count){
        ticker ++;
    }
    if (Card2.count == Card3.count){
        ticker ++;
    }
    NSLog(@"countTicker: %d",ticker);
    if (ticker == 1){
        return NO;
    } else{
        return YES;
    }
}

- (BOOL)rightSet:(NSArray *)selected
{
    NSLog(@"\n\n\nCHECK\n\n\n");
    if ([selected[0] isKindOfClass:[SetCard class]] &&
        [selected[1] isKindOfClass:[SetCard class]] &&
        [selected[2] isKindOfClass:[SetCard class]]){
        SetCard *Card1 = (SetCard *)selected[0];
        SetCard *Card2 = (SetCard *)selected[1];
        SetCard *Card3 = (SetCard *)selected[2];
        
        if(![self rightForCard1:Card1 Card2:Card2 Card3:Card3 property:@"fill"]){
            return NO;
        }
        if(![self rightForCard1:Card1 Card2:Card2 Card3:Card3 property:@"color"]){
            return NO;
        }
        if(![self rightForCard1:Card1 Card2:Card2 Card3:Card3 property:@"shape"]){
            return NO;
        }
        if(![self rightCountForCard1:Card1 Card2:Card2 Card3:Card3]){
            return NO;
        }
    }else{
        return NO;
    }
    return YES;
}

- (int) cardsInPlay
{
    return 12;
}

@end
