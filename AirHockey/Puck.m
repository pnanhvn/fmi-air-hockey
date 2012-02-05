//
//  Puck.m
//  AirHockey
//
//  Created by Nikolay Dimitrov on 2/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Puck.h"
#include "math.h"


@implementation Puck
- (void) checkForCollisionsWithMulletOne: (PlayDisk*) mulletOne andMulletTwo: (PlayDisk*) mulletTwo{
    double hypotenuseForMalletOne = sqrt(pow([self getCenter].x - [mulletOne getCenter].x, 2) + pow([self getCenter].y - [mulletOne getCenter].y, 2));
    if ((self.radius + mulletOne.radius) >= hypotenuseForMalletOne){
        double cosToMalletOne = abs([self getCenter].x - [mulletOne getCenter].x) / hypotenuseForMalletOne;
        double angle = acos(cosToMalletOne);
        imageView.frame= CGRectMake(imageView.frame.origin.x + 10, imageView.frame.origin.y + 10, imageView.frame.size.width, imageView.frame.size.height);
    } 
    
    
    
    double hypotenuseForMalletTwo = sqrt(pow([self getCenter].x - [mulletTwo getCenter].x, 2) + pow([self getCenter].y - [mulletTwo getCenter].y, 2));
    
    if ((self.radius + mulletTwo.radius) >= hypotenuseForMalletTwo){
        double cosToMalletTwo = abs([self getCenter].x - [mulletTwo getCenter].x) / hypotenuseForMalletTwo;
        imageView.frame= CGRectMake(imageView.frame.origin.x + 10, imageView.frame.origin.y + 10, imageView.frame.size.width, imageView.frame.size.height);
    } 
    
    
}
@end
