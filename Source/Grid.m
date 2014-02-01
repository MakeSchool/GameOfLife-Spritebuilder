//
//  Grid.m
//  GameOfLife
//
//  Created by Benjamin Encz on 31/01/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"

static const int GRID_ROWS = 10;
static const int GRID_COLUMNS = 10;

@implementation Grid {
    NSMutableArray *_gridArray;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (void)onEnter
{
    float stepX = self.contentSize.width / GRID_ROWS;
    float stepY = self.contentSize.height / GRID_COLUMNS;
    float x = 0;
    float y = 0;
    
    _gridArray = [NSMutableArray array];
    
    // initialize Creatures
    for (int i = 0; i < GRID_COLUMNS; i++) {
        _gridArray[i] = [NSMutableArray array];
        x = 0;
        
        for (int j = 0; j < GRID_ROWS; j++) {
            Creature *creature = [[Creature alloc] initCreature];
            creature.anchorPoint = ccp(0, 0);
            creature.position = ccp(x, y);
            creature.isAlive = FALSE;
            [self addChild:creature];
            
            _gridArray[i][j] = creature;
            
            x+=stepX;
        }
        
        y += stepY;
    }
}

@end