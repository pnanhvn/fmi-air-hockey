//
//  PlayerMenuViewControler.h
//  AirHockey
//
//  Created by Seshiro on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

UIImageView* malletOneChoice;
UIImageView* malletTwoChoice;

NSString* playerOneName;
NSString* playerTwoName;

@interface PlayerMenuViewController : UIViewController<UIGestureRecognizerDelegate> {
   
    IBOutlet UIImageView* malletOneBlue;
    IBOutlet UIImageView* malletOneRed;
    IBOutlet UIImageView* malletOneGreen;
    IBOutlet UIImageView* malletOneYellow;
    
    IBOutlet UIImageView* malletTwoBlue;
    IBOutlet UIImageView* malletTwoRed;
    IBOutlet UIImageView* malletTwoGreen;
    IBOutlet UIImageView* malletTwoYellow;
    
    IBOutlet UITextField* namePlayerOne;
    IBOutlet UITextField* namePlayerTwo;
}

-(IBAction)showPlaygroundView;

@end

