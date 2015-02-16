//
//  Set.m
//  TennisInObjectiveC
//
//  Created by student on 2/4/15.
//  Copyright (c) 2015 Ali Kooshesh. All rights reserved.
//

#import "Set.h"
#import "SetScore.h"
#import "PointScore.h"
#import "Score.h"
#import "TieBreaker.h"
#import "Game.h"

@implementation Set 

-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer:(Player *) p2
{
    if( (self = [super initWithFirstPlayer:p1 secondPlayer:p2] ) == nil )
        return nil;
    return self;
}

-(Score *) play:(Player *)player
{
    SetScore *setScore = [[SetScore alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
    
    while( ! [setScore haveAWinner] ) {
        Game *game = [[Game alloc]   initWithFirstPlayer:self.player1 secondPlayer:self.player2];
        PointScore *pScore =  (PointScore *) [game play:player];
        [setScore addScore: [pScore getWinner]];
        
        if ([setScore shouldPlayATieBreaker]) { //plays tie breaker game if necessary and returns the outcome with the final set score
            player = [Player otherPlayer:player];
            PointScore *tieBreakerScore = (PointScore *)[game play:player];
                    [setScore addScore:[tieBreakerScore getWinner]];
            return setScore;
        }
        player = [Player otherPlayer:player];//sets player to other player
        pScore = nil;
    }
    return setScore;
}
@end
