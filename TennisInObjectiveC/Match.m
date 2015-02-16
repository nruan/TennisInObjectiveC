//
//  Match.m
//  TennisInObjectiveC
//
//  Created by student on 2/4/15.
//  Copyright (c) 2015 Ali Kooshesh. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "Match.h"
#import "Set.h" 
#import "MatchScore.h"
//#import "Game.h"
#import "SetScore.h"
#import "Score.h"

@implementation Match
-(instancetype) initWithFirstPlayer:(Player *)p1 secondPlayer:(Player *)p2{
    if( (self = [super initWithFirstPlayer:p1 secondPlayer:p2] ) == nil )
        return nil;
    return self;
}

-(Score *) play:(Player *)player{
    Score *matchScore = [[MatchScore alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
    int setNumber = 1;
    while (! [matchScore haveAWinner]) {
        Set *set = [[Set alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
        SetScore *setScore = (SetScore *) [set play:player] ;
        [matchScore addScore:[setScore getWinner]];
        NSLog(@"%@", setScore);
        setScore = nil;
        player = [Player otherPlayer:player];
        setNumber++;
    }
    return matchScore;
}

@end