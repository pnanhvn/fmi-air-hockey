//
//  Game.h
//  AirHockey
//
//  Created by Nikolay Dimitrov on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Puck.h"
#import "Mallet.h"
#import "PointsView.h"

@interface Game : NSObject{
    CGRect fieldSize_;
    int firstPlayerPoints_;
    int secondPlayerPoints_;
}

- (id)initWithMalletOne: (Mallet *) malletOne malletTwo: (Mallet *) malletTwo puck: (Puck *) puck fieldSize: (CGRect) fieldSize;
- (void) tapOnGameScreenLocation: (CGPoint) location;
- (void) timeElapsed;
- (void) pointScoredForFirstPlayer: (Boolean) forFirstPlayer;
- (void) resetGame;

@property(retain) Puck* puck;
@property(retain) Mallet* malletOne;
@property(retain) Mallet* malletTwo;
@property(retain) PointsView* firstPlayerPointsView;
@property(retain) PointsView* secondPlayerPointsView;


@end
