//
//  Creature.m
//  GameOfLife
//
//  Created by Benjamin Encz on 31/01/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Creature.h"

@implementation Creature

- (id)initCreature
{
    CCSpriteFrame* spriteFrame = [CCSpriteFrame frameWithImageNamed:@"GameOfLifeAssets/Assets/bubble.png"];

    self = [super initWithSpriteFrame:spriteFrame];
    
    if (self) {
    }
    
    return self;
}

- (void)setIsAlive:(BOOL)isAlive {
    _isAlive = isAlive;
    self.visible = _isAlive;
}

@end
