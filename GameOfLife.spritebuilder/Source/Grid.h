//
//  Grid.h
//  GameOfLife
//
//  Created by Benjamin Encz on 31/01/14.
//  Copyright (c) 2014 MakeGamesWithUs inc. Free to use for all purposes.
//

#import "CCSprite.h"

@interface Grid : CCSprite

@property (nonatomic, assign) int totalAlive;
@property (nonatomic, assign) int generation;

- (void)evolveStep;
- (void)countNeighbors;
- (void)updateCreatures;

@end
