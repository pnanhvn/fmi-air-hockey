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
- (id)init {
    self = [super init];
    if (self) {
        hitAWall = false;
    }
    return self;
}

- (void) checkForCollisionsWithMullet:(PlayDisk *)mullet{
    double hypotenuseForMalletOne = sqrt(pow([self getCenter].x - [mullet getCenter].x, 2) + pow([self getCenter].y - [mullet getCenter].y, 2));
    if ((self.radius + mullet.radius) >= hypotenuseForMalletOne){
        //double tanToTangent = ([self getCenter].y - [mullet getCenter].y) / ([self getCenter].x - [mullet getCenter].x);
        double angle = atan2([self getCenter].y - [mullet getCenter].y , [self getCenter].x - [mullet getCenter].x);
        
        if([self getCenter].x < [mullet getCenter].x){
            //angle += M_PI;
        }
        
        self.angle = angle;
        self.speed += mullet.speed;
        mullet.speed = 0;
    }  
}
- (void) checkForCollisionsWithMulletOne: (PlayDisk*) mulletOne andMulletTwo: (PlayDisk*) mulletTwo{
    [self checkForCollisionsWithMullet:mulletOne];
    
    [self checkForCollisionsWithMullet:mulletTwo];
    

    if(imageView.frame.origin.x < maxFieldSize.origin.x || imageView.frame.origin.x + 2 * self.radius > maxFieldSize.origin.x  + maxFieldSize.size.width ){
        self.angle = M_PI + self.angle;
    }
    
    if(imageView.frame.origin.x < maxFieldSize.origin.x || imageView.frame.origin.y < maxFieldSize.origin.y || imageView.frame.origin.x + 2 * self.radius > maxFieldSize.origin.x  + maxFieldSize.size.width || imageView.frame.origin.y + 2 * self.radius> maxFieldSize.origin.y  + maxFieldSize.size.height){
            self.angle = -self.angle;
 
    }
}



- (void) moveForElapsedTime: (double) elapsedTime{
    
    if(self.speed > 0.01) imageView.frame= CGRectMake(imageView.frame.origin.x + self.speed * cos(self.angle), imageView.frame.origin.y + self.speed*sin(self.angle), imageView.frame.size.width, imageView.frame.size.height);
    if (self.speed > 0) {
        self.speed -= 0.3;  
    }
    else{
        self.speed = 0.0;
    }
}
@end
