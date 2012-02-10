//
//  Game.m
//  AirHockey
//
//  Created by Nikolay Dimitrov on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@implementation Game
@synthesize malletOne = malletOne_;
@synthesize malletTwo = malletTwo_;
@synthesize puck = puck_;
@synthesize firstPlayerPointsView;
@synthesize secondPlayerPointsView;

- (void) showPoints{
    [firstPlayerPointsView showPoints:firstPlayerPoints_];
    [secondPlayerPointsView showPoints:secondPlayerPoints_];
}

- (void) resetPoints{
    firstPlayerPoints_ = 0;
    secondPlayerPoints_ = 0;
    
    [self showPoints];
}

- (void) resetPositions{
    [self.puck moveToStart];
    [self.malletOne moveToStart];
    [self.malletTwo moveToStart];
}

- (void) resetGame{
    [self resetPoints];
    [self resetPositions];
}

- (id)initWithMalletOne: (Mallet *) malletOne malletTwo: (Mallet *) malletTwo puck: (Puck *) puck fieldSize: (CGRect) fieldSize{
    self = [super init];
    if (self) {
        self.puck = puck;
        self.puck.game = self;
        self.malletOne = malletOne;
        self.malletTwo = malletTwo;
        fieldSize_ = fieldSize;
        
        [self resetPoints];
    }
    return self;
}

- (void) tapOnGameScreenLocation: (CGPoint) location{

    if(location.y > fieldSize_.size.height / 2){
        [self.malletOne moveToPositionX:location.x Y:location.y];
    }
    else{
        [self.malletTwo moveToPositionX:location.x Y:location.y];
    }
}

- (void) timeElapsed {
    [self.puck checkForCollisionsWithMalletOne:self.malletOne andMalletTwo:self.malletTwo];
    [self.puck moveForElapsedTime: 0.1];
}

- (void) pointScoredForFirstPlayer: (Boolean) forFirstPlayer{
    [self resetPositions];
    
    if(forFirstPlayer){
        firstPlayerPoints_++;
        if(firstPlayerPoints_ >= 7) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"First player wins!"  message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            [alert release];
            
            [self resetGame];
        }
    }
    else{
        secondPlayerPoints_++;
        if(secondPlayerPoints_ >= 7) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Second player wins!"  message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            [alert release];
            
            [self resetGame];
        }
    }
    
    [self showPoints];
}
 
- (void)dealloc {
    self.malletOne = nil;
    self.malletTwo = nil;
    self.puck = nil;
    self.firstPlayerPointsView = nil;
    self.secondPlayerPointsView = nil;
    [super dealloc];
}
@end
