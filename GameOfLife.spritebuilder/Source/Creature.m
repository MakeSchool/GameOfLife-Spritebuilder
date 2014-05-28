//
//  Creature.m
//  GameOfLife
//
//  Created by Benjamin Encz on 31/01/14.
//  Copyright (c) 2014 MakeGamesWithUs inc. Free to use for all purposes.
//

#import "Creature.h"

@implementation Creature

- (id)initCreature {
  self = [super initWithImageNamed:@"GameOfLifeAssets/Assets/bubble.png"];

  if (self) {
    self.isAlive = NO;
  }

  return self;
}

- (void)setIsAlive:(BOOL)isAlive {
  _isAlive = isAlive;
  self.visible = _isAlive;
}

@end
