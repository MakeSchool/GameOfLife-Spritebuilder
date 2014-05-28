//
//  Creature.h
//  GameOfLife
//
//  Created by Benjamin Encz on 31/01/14.
//  Copyright (c) 2014 MakeGamesWithUs inc. Free to use for all purposes.
//

#import "CCSprite.h"

@interface Creature : CCSprite

// stores the current state of the creature
@property (nonatomic, assign) BOOL isAlive;

// stores the amount of living neighbours
@property (nonatomic, assign) NSInteger livingNeighbours;

- (id)initCreature;

@end
