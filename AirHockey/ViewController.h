//
//  ViewController.h
//  AirHockey
//
//  Created by Nikolay Dimitrov on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayDisk.h"
#import "Mallet.h"
#import "Puck.h"

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
    
    IBOutlet UIImageView *puck;
    IBOutlet UIImageView *secondPlayerMallet;
    IBOutlet UIImageView *firstPlayerMallet;
    double firstMalletX;
    double firstMalletY;
    double secondMalletX; 
    double secondMalletY;
    Puck *puckDisk;
    Mallet *firstMalletDisk, *secondMalletDisk;

}

-(IBAction)goToPlayerMenu;

@end
