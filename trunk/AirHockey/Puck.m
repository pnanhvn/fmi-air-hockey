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

- (Boolean) checkForCollisionsWithMullet:(PlayDisk *)mullet{
    double hypotenuseForMalletOne = sqrt(pow([self getCenter].x - [mullet getCenter].x, 2) + pow([self getCenter].y - [mullet getCenter].y, 2));
    if ((self.radius + mullet.radius) >= hypotenuseForMalletOne){
        //double tanToTangent = ([self getCenter].y - [mullet getCenter].y) / ([self getCenter].x - [mullet getCenter].x);
        double angle = atan2([self getCenter].y - [mullet getCenter].y , [self getCenter].x - [mullet getCenter].x);
        
        
        self.angle = angle;
        self.speed += mullet.speed;
        if(self.speed > 50.0) self.speed = 50.0;
        
        
        NSLog(@"puck speed: %f mullet speed: %f", self.speed, mullet.speed);
        //self.speed = 20;
        mullet.speed = 0;
        
        return true;
        
    }  
    return false;
}
- (void) checkForCollisionsWithMulletOne: (PlayDisk*) mulletOne andMulletTwo: (PlayDisk*) mulletTwo{
    [self checkForCollisionsWithMullet:mulletOne];
    
    [self checkForCollisionsWithMullet:mulletTwo];
    

    if(imageView.frame.origin.x < maxFieldSize.origin.x || imageView.frame.origin.x + 2 * self.radius > maxFieldSize.origin.x  + maxFieldSize.size.width ){
        self.angle = -M_PI - self.angle;
    }
    
    if(imageView.frame.origin.y < maxFieldSize.origin.y || imageView.frame.origin.y + 2 * self.radius> maxFieldSize.origin.y  + maxFieldSize.size.height){
        if(imageView.frame.origin.x > 200 && imageView.frame.origin.x < 568){
            self.speed = 0.0;
            self.angle = 0.0;
           
            
            [self moveToStart];
            [mulletOne moveToStart];
            [mulletTwo moveToStart];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Point" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            [alert release];
        }
        else{
            self.angle = -self.angle;
        }
            
 
    }
}



- (void) moveForElapsedTime: (double) elapsedTime{
    double newX = imageView.frame.origin.x + self.speed * cos(self.angle);
    double newY = imageView.frame.origin.y + self.speed * sin(self.angle);
    
    if(newX < maxFieldSize.origin.x - 100) newX = maxFieldSize.origin.x;
    if(newX +  2 * self.radius > maxFieldSize.origin.x + maxFieldSize.size.width + 100) newX = maxFieldSize.origin.x + maxFieldSize.size.width;
    if(newY < maxFieldSize.origin.y - 100) newY = maxFieldSize.origin.y;
    if(newY + 2 * self.radius > maxFieldSize.origin.y + maxFieldSize.size.height + 100) newY = maxFieldSize.origin.y + maxFieldSize.size.height;
    
    if(self.speed > 0.01) imageView.frame= CGRectMake(newX, newY, imageView.frame.size.width, imageView.frame.size.height);
    if (self.speed > 0) {
        self.speed -= 0.3;  
    }
    else{
        self.speed = 0.0;
    }
}
@end
