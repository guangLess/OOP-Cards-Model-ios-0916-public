//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by Guang on 10/5/15.
//  Copyright © 2015 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"

@implementation FISCardDeck


-(instancetype)init{
    
    self = [super self];
    if (self) {
        
        _remainingCards = [[NSMutableArray alloc] init];
        _dealtCards = [[NSMutableArray alloc] init];
        [self generateCards];
    }
    
    return self;
}

-(void)generateCards{

    
    FISCard * cardSet = [[FISCard alloc] init];
    
    NSArray * allSuitKind = [[cardSet class] validSuits];
    NSArray * allRanksKind = [[cardSet class] validRanks];
    
    for (NSString *eachSuit in allSuitKind) {
        for (NSString *eachRank in allRanksKind) {
            
            FISCard * eachCardClass = [[FISCard alloc] initWithSuit:eachSuit rank:eachRank];
            [self.remainingCards addObject:eachCardClass];
        }
    }
}

/*
 
It should return a card at one end of the array (it is up to you to choose between making this either the first object or the last object in the array). However, this method should also remove that card from the remainingCards array, 
 and also add it to the dealtCards array. 
 This way, our instance of FISCardDeck will always keep track of all fifty-two cards, even after drawing them.
 You'll notice that there's a test which attempts to draw a fifty-third card from our fifty-two card deck. 
 Add a protection against this behavior at the beginning of the drawNextCard method to 
 return nil if there are no cards in the remainingCards array.
 
 Write the implementation for the resetDeck method 
 to call the gatherDealtCards method and then 
 the shuffleRemainingCards method. That's it,
 however the tests for resetDeck will fail until those other method implementations are completed.
 
 Write the implementation for the gatherDealtCards method. 
 It should add the cards in the dealtCards array 
 back into the remainingCards array 
 and leave the dealtCards array empty.
 
 */

-(FISCard *)drawNextCard{
    
    if (self.remainingCards.count == 0) {
        return nil;
        NSLog(@"Array is Empty AHH");
    }
    else{

        FISCard * cardDraw = self.remainingCards.lastObject;

        [self.dealtCards addObject: cardDraw];
        [self.remainingCards removeLastObject];

        return cardDraw;
    }
}

-(void)resetDeck{
    
    [self gatherDealtCards];
    [self shuffleRemainingCards];
    
}
-(void)gatherDealtCards{
    
   // [self.remainingCards addObject:self.dealtCards];
   // [self.dealtCards removeAllObjects];
    
}

/*
 
 randomly draw a card out of the copied mutable array and 
 insert it into the remainingCards array 
 (make sure to remove it from the copied array).
 */
-(void)shuffleRemainingCards{
    
    NSMutableArray * cardMemory = [self.remainingCards mutableCopy];
    [self.remainingCards removeAllObjects];
    
    if (cardMemory.count == 52) {

        for (NSUInteger i = 0 ; i < 52 ; i ++ ) {
            
            NSUInteger random = arc4random_uniform(52);
            FISCard * randomCard = [cardMemory objectAtIndex:random];
            [self.remainingCards addObject:randomCard];
            [cardMemory removeObjectAtIndex:random];
        }
        
    }
}


@end
