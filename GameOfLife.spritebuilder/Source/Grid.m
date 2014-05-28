//
//  Grid.m
//  GameOfLife
//
//  Created by Benjamin Encz on 31/01/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"

static const int GRID_ROWS = 8;
static const int GRID_COLUMNS = 10;

@implementation Grid {
  NSMutableArray *_gridArray;
  float _columnWidth;
  float _columnHeight;
  int _generation;
  int _totalAlive;
}

#pragma mark - Lifecycle

- (void)onEnter {
  [super onEnter];

  [self setupGrid];

  // accept touches on the grid
  self.userInteractionEnabled = YES;
}

- (void)setupGrid {
  _columnWidth = self.contentSize.width / GRID_COLUMNS;
  _columnHeight = self.contentSize.height / GRID_ROWS;
  float x = 0;
  float y = 0;

  _gridArray = [NSMutableArray array];

  // initialize Creatures
  for (int i = 0; i < GRID_ROWS; i++) {
    _gridArray[i] = [NSMutableArray array];
    x = 0;

    for (int j = 0; j < GRID_COLUMNS; j++) {
      Creature *creature = [[Creature alloc]initCreature];
      creature.anchorPoint = ccp(0, 0);
      creature.position = ccp(x, y);
      [self addChild:creature];
      _gridArray[i][j] = creature;

      x+=_columnWidth;
    }

    y += _columnHeight;
  }
}

#pragma mark - Touch Handling

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
  CGPoint touchLocation = [touch locationInNode:self];

  Creature *creature = [self creatureForTouchPosition:touchLocation];
  creature.isAlive = !creature.isAlive;
}

- (Creature *)creatureForTouchPosition:(CGPoint)touchPosition {
  Creature *creature = nil;

  int column = touchPosition.x / _columnWidth;
  int row = touchPosition.y / _columnHeight;
  creature = _gridArray[row][column];

  return creature;
}

#pragma mark - Util function

- (BOOL)indexesValid:(int)x y:(int)y {
  BOOL indexesValid = YES;
  indexesValid &= x > 0;
  indexesValid &= y > 0;
  if (indexesValid) {
    indexesValid &= x < (int) [_gridArray count];
    if (indexesValid) {
      indexesValid &= y < (int) [(NSMutableArray *) _gridArray[x] count];
    }
  }
  return indexesValid;
}

#pragma mark - Game Logic

- (void)countNeighbours {
  // rows
  for (int i = 0; i < [_gridArray count]; i++) {
    // columns
    for (int j = 0; j < [_gridArray[i] count]; j++) {
      Creature *currentCreature = _gridArray[i][j];
      // reset neighbour counter
      currentCreature.livingNeighbours = 0;

      for (int x = (i-1); x <= (i+1); x++) {
        for (int y = (j-1); y <= (j+1); y++) {
          BOOL indexesValid;
          indexesValid = [self indexesValid:x y:y];

          if (!((x == i) && (y == j)) && indexesValid) {
            Creature *neighbour = _gridArray[x][y];
            currentCreature.livingNeighbours += neighbour.isAlive;
          }
        }
      }
    }
  }
}

- (void)evolveStep {
  [self countNeighbours];

  int alive = 0;

  for (int i = 0; i < [_gridArray count]; i++) {
    for (int j = 0; j < [_gridArray[i] count]; j++) {
      Creature *currentCreature = _gridArray[i][j];
      if (currentCreature.livingNeighbours == 3) {
        currentCreature.isAlive = YES;
      } else if ( (currentCreature.livingNeighbours <= 1) || (currentCreature.livingNeighbours >= 4)) {
        currentCreature.isAlive = NO;
      }

      if (currentCreature.isAlive) {
        alive++;
      }
    }
  }

  _generation++;
  _totalAlive = alive;
}

@end