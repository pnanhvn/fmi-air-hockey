//
//  PlayerMenuViewControler.h
//  AirHockey
//
//  Created by Seshiro on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerMenuViewController : UIViewController {
   
    IBOutlet UIImageView* malletOneBlue;
    IBOutlet UIImageView* malletOneRed;
    IBOutlet UIImageView* malletOneGreen;
    IBOutlet UIImageView* malletOneYellow;
    
    IBOutlet UIImageView* malletTwoBlue;
    IBOutlet UIImageView* malletTwoRed;
    IBOutlet UIImageView* malletTwoGreen;
    IBOutlet UIImageView* malletTwoYellow; 
}
@property NSString* malletOneChoice;
@property NSString* malletTwoChoice;

@property NSString* playerOneName;
@property NSString* playerTwoName;

-(IBAction)showPlaygroundView;

@end
