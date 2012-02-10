//
//  Puck.h
//  AirHockey
//
//  Created by Nikolay Dimitrov on 2/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayDisk.h"
@class Game;

@interface Puck : PlayDisk{
    Boolean hitAWall;
}
- (void) moveForElapsedTime: (double) elapsedTime;
- (void) checkForCollisionsWithMalletOne: (PlayDisk*) malletOne andMalletTwo: (PlayDisk*) malletTwo;

@property(assign) Game* game;
@end
