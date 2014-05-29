//
//  MatchGameViewController.m
//  MyCardGame
//
//  Created by Carter Levin on 5/23/14.
//  Copyright (c) 2014 Carter Levin. All rights reserved.
//

//
//  MatchGameViewController.m
//  MyCardGame
//
//  Created by Carter Levin on 5/23/14.
//  Copyright (c) 2014 Carter Levin. All rights reserved.
//

#import "MatchGameViewController.h"
#import "setDeck.h"
#import "SetCard.h"
#import "GameLogic.h"
#import "SetCardView.h"

@interface MatchGameViewController ()
@property (nonatomic) setDeck *setDeck;
@property (nonatomic) GameLogic *game;
@property (strong, nonatomic) NSMutableDictionary *cardsAndButtons;
@property (strong, nonatomic) NSMutableArray *selectedCards;

//All Button/Label outlets bellow
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *setCard;
//Below is a test
@property (weak, nonatomic) IBOutlet SetCardView *setCardsView;
@end

@implementation MatchGameViewController

- (void) setSetCardsView:(SetCardView *)setCardsView
{
    _setCardsView = setCardsView;
    setCardsView.color = @"red";
    setCardsView.fill = @"blank";
    setCardsView.count = 2;
    setCardsView.shape = @"squiggle";
}

- (setDeck *)setDeck
{
    if (!_setDeck){
        _setDeck = [[setDeck alloc] init];
    }
    return _setDeck;
}

-(GameLogic *)game
{
    if (!_game){
        _game = [[GameLogic alloc]init];
    }
    return _game;
}

- (NSMutableArray *)selectedCards
{
    if (!_selectedCards){
        _selectedCards = [[NSMutableArray alloc] init];
    }
    return _selectedCards;
}

- (NSMutableDictionary *)cardsAndButtons
{
    if (!_cardsAndButtons){
        _cardsAndButtons = [[NSMutableDictionary alloc] init];
    }
    return _cardsAndButtons;
}

- (void) dealGame
{
    [self.setDeck createDeck];
    NSLog(@"%@",self.setDeck);
    for (UIButton *cardButton in self.setCard){
        SetCard *card = [self.setDeck selectRandomCard];
        [self.cardsAndButtons setObject:card forKey:
         [NSString stringWithFormat:@"%@",cardButton]];
        cardButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [cardButton.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [cardButton setTitle:[NSString stringWithFormat:@"%@\n%@\n%d\n%@",card.color,card.shape,card.count,card.fill] forState:UIControlStateNormal];
    }
}

- (BOOL)checkSet
{
    if (self.selectedCards.count == 3){
        NSLog(@"EQUALS THREE");
        BOOL hasSet = [self.game rightSet:self.selectedCards];
        NSLog(@"%hhd",hasSet);
        if(hasSet){
            for (SetCard *card in self.selectedCards){
                NSLog(@"SET!\n%@\n%@\n%d\n%@",card.shape,card.color,card.count,card.fill);
            }
            self.selectedCards = nil;
            return YES;
        }
        self.selectedCards = nil;
    }
    return NO;
}

- (IBAction)selectCard:(id)sender {
    SetCard *selectedCard = self.cardsAndButtons[[NSString stringWithFormat:@"%@",sender]];
    [self.selectedCards addObject:selectedCard];
    if([self checkSet]){
        NSLog(@"THIS IS A SET");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self dealGame];
    // Do any additional set up after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end