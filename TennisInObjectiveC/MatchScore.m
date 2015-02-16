//
//  MatchScore.m
//  TennisInObjectiveC
//
//  Created by student on 2/4/15.
//  Copyright (c) 2015 Ali Kooshesh. All rights reserved.
//

#import "MatchScore.h"
#import "SetScore.h"
#import "Score.h"

@interface MatchScore()
@property(nonatomic) NSMutableArray * scores;
@end

@implementation MatchScore

-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2
{
    if( (self = [super initWithFirstPlayer:p1 secondPlayer:p2   ]) == nil)
        return nil;
    self.scores = [[NSMutableArray alloc] init];
    return self;
}

-(BOOL) haveAWinner{
    return (self.player1Score == 3 || self.player2Score == 3);
}


-(void) addSetScore: (SetScore *) setScore {
    [self addScore:[setScore getWinner]];
    [self.scores addObject:setScore];
}

-(void) addScore:(Player *)p {
    p == self.player1 ? self.player1Score++ : self.player2Score++;
}

-(NSString *) description
{

    NSLog(@"The final score is " );
    return [NSString stringWithFormat:@"\n\nplayer1 Match score = %d\nplayer2 Match score = %d\n\n", self.player1Score, self.player2Score];
}

@end
