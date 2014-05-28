//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Benjamin Encz on 10/10/13.
//  Copyright (c) 2014 MakeGamesWithUs inc. Free to use for all purposes.
//

#import "MainScene.h"
#import "Grid.h"

@implementation MainScene {
  Grid *_grid;
  CCTimer *_timer;
  CCLabelTTF *_generationLabel;
  CCLabelTTF *_populationLabel;
}

- (id)init {
  self = [super init];

  if (self) {
    _timer = [[CCTimer alloc]init];
  }

  return self;
}

- (void)play {
  [self schedule:@selector(step) interval:0.5f];
}

- (void)pause {
  [self unschedule:@selector(step)];
}

- (void)step {
  [_grid evolveStep];
  _generationLabel.string = [NSString stringWithFormat:@"%d", _grid.generation];
  _populationLabel.string = [NSString stringWithFormat:@"%d", _grid.totalAlive];
}

@end
