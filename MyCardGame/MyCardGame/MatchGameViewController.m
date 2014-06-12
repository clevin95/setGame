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
#import "SetCardCollectionViewCell.h"

@interface MatchGameViewController () <UICollectionViewDataSource>
@property (nonatomic) setDeck *setDeck;
@property (nonatomic) GameLogic *game;
@property (strong, nonatomic) NSMutableDictionary *cardsAndButtons;
@property (strong, nonatomic) NSMutableArray *selectedCards;
//All Button/Label outlets bellow
//Below is a test
@property (weak, nonatomic) IBOutlet UICollectionView *SetCardCollectionView;
@end

@implementation MatchGameViewController

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.game cardsInPlay];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SetCard" forIndexPath:indexPath];
    [self updateCell:cell];
    return cell;
}

- (void)selectCardAtIndex:(NSIndexPath *)indexPath
{
    UICollectionViewCell *selectedCell=[self.SetCardCollectionView cellForItemAtIndexPath:indexPath];
    if ([selectedCell isKindOfClass:[SetCardCollectionViewCell class]]){
        SetCardCollectionViewCell *selectedCollectionViewCell = (SetCardCollectionViewCell *) selectedCell;
        SetCardView *sender = selectedCollectionViewCell.setCardView;
        SetCardView *setCardView = sender;
        SetCard *newSelected = [[SetCard alloc]init];
        newSelected.count = setCardView.count;
        newSelected.color = setCardView.color;
        newSelected.fill = setCardView.fill; 
        newSelected.shape = setCardView.shape;
        [self.selectedCards addObject:newSelected];
        [self checkSet];
    }

}


- (IBAction)cardSelected:(UITapGestureRecognizer *)gesture {
    CGPoint possitionInView = [gesture locationInView:self.SetCardCollectionView];
    NSIndexPath *indexPath = [self.SetCardCollectionView indexPathForItemAtPoint:possitionInView];
    if (indexPath){
        [self selectCardAtIndex:indexPath];
    }
}

- (void)updateCell:(UICollectionViewCell *)cell
{
    if ([cell isKindOfClass:[SetCardCollectionViewCell class ]]){
        SetCard *setCard = [self.setDeck selectRandomCard];
        SetCardView *SetCardView = ((SetCardCollectionViewCell *)cell).setCardView;
        SetCardView.count = setCard.count;
        SetCardView.color = setCard.color;
        SetCardView.fill = setCard.fill;
        SetCardView.shape = setCard.shape;
    }
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