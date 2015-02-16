//
//  SetScore.m
//  TennisInObjectiveC
//
//  Created by student on 2/4/15.
//  Copyright (c) 2015 Ali Kooshesh. All rights reserved.
//

#import "SetScore.h"
#import "TieBreaker.h"
#import "TieBreakerScore.h"

@implementation SetScore

int setNumber = 1;
-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2
{
    if( (self = [super initWithFirstPlayer:p1 secondPlayer:p2   ]) == nil)
        return nil;
    return self;
}

-(BOOL) haveAWinner
{
    return (self.player1Score >= 6 || self.player2Score >= 6) && abs( self.player1Score - self.player2Score) >= 2;
}

-(BOOL) shouldPlayATieBreaker{
    
    return (self.player1Score == 6 && self.player2Score == 6);
}

-(void) addTieScore: (TieBreakerScore *) score{
    [score addScore: [score getWinner]];
    self.tieScore = score;
}


-(NSString *) description
{
  
    return [NSString stringWithFormat:@"\n\nplayer1 Set Score = %d\nplayer2 Set Score = %d\n\n", self.player1Score, self.player2Score];
}

@end

