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

@interface ViewController : UIViewController{
    
    IBOutlet UIImageView *puck;
    IBOutlet UIImageView *secondPlayerMallet;
    IBOutlet UIImageView *firstPlayerMallet;
    double firstMalletX;
    double firstMalletY;
    double secondMalletX; 
    double secondMalletY;
    
    PlayDisk *puckDisk;
    Mallet *firstMalletDisk, *secondMalletDisk;

}


@end
