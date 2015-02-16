//
//  TieBreaker.h
//  TennisInObjectiveC
//
//  Created by student on 2/4/15.
//  Copyright (c) 2015 Ali Kooshesh. All rights reserved.
//
#import <Foundation/Foundation.h>
#include "TieBreaker.h"
#include "Score.h"
#include "Competition.h"

@interface TieBreaker  : Competition

-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer:(Player *) p2;
-(Score *) play: (Player *) player;

@end