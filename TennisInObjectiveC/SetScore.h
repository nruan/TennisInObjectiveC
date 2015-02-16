//
//  SetScore.h
//  TennisInObjectiveC
//
//  Created by student on 2/4/15.
//  Copyright (c) 2015 Ali Kooshesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Score.h"
#import "Player.h"
#import "TieBreaker.h"
#import "TieBreakerScore.h"
@interface SetScore : Score

-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2;
//-(Score *) play: (Player *) player;
-(void) addTieScore: (TieBreakerScore *) score;
-(BOOL) haveAWinner;
-(BOOL) shouldPlayATieBreaker;
@property (nonatomic) TieBreakerScore *tieScore;
@end

