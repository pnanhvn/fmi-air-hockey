//
//  Puck.m
//  AirHockey
//
//  Created by Nikolay Dimitrov on 2/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Puck.h"


@implementation Puck
- (void) checkForCollisionsWithMulletOne: (PlayDisk*) mulletOne andMulletTwo: (PlayDisk*) mulletTwo{
    double hypotenuseForMalletOne = sqrt(pow(self.center.x - mulletOne.center.x, 2) + pow(self.center.y - mulletOne.center.y, 2));
    if ((self.radius + mulletOne.radius) <= hypotenuseForMalletOne){
    
    } 
    
    double cosToMalletOne = abs(self.center.x - mulletOne.center.x) / hypotenuseForMalletOne;
    
    double hypotenuseForMalletTwo = sqrt(pow(self.center.x - mulletTwo.center.x, 2) + pow(self.center.y - mulletTwo.center.y, 2));
    
    if ((self.radius + mulletTwo.radius) <= hypotenuseForMalletTwo){
        
    } 
    
    double cosToMalletTwo = abs(self.center.x - mulletTwo.center.x) / hypotenuseForMalletTwo;
}
@end
