//
//  ViewController.h
//  AirHockey
//
//  Created by Nikolay Dimitrov on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayDisk.h"
#import "Game.h"

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
    
    IBOutlet UIImageView *puck;

    IBOutlet UIImageView *firstPlayerMallet;
    IBOutlet PointsView *firstPlayerPointsView;
    IBOutlet PointsView *secondPlayerPointsView;
    IBOutlet UIImageView *secondPlayerMallet;
    IBOutlet UIImageView *pauseImg;
    
    Game* game;

}

-(void) goToPlayerMenu:(UITapGestureRecognizer*) grec;

@end
