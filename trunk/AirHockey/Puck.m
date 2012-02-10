//
//  Puck.m
//  AirHockey
//
//  Created by Nikolay Dimitrov on 2/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Puck.h"
#include "math.h"
#include "GameConstants.h"
#import "Game.h"


@implementation Puck
@synthesize game;

- (id)init {
    self = [super init];
    if (self) {
        hitAWall = false;
    }
    return self;
}



- (Boolean) checkForCollisionsWithmallet:(PlayDisk *)mallet{
    double hypotenuseForMalletOne = sqrt(pow([self getCenter].x - [mallet getCenter].x, 2) + pow([self getCenter].y - [mallet getCenter].y, 2));
    if ((self.radius + mallet.radius) >= hypotenuseForMalletOne){
        double angle = atan2([self getCenter].y - [mallet getCenter].y , [self getCenter].x - [mallet getCenter].x);
        
        
        self.angle = angle;
        self.speed += mallet.speed;
        if(self.speed > MAX_SPEED) self.speed = MAX_SPEED;
        
        
        mallet.speed = 0;
        
        return true;
        
    }  
    return false;
}
- (void) checkForCollisionsWithMalletOne: (PlayDisk*) malletOne andMalletTwo: (PlayDisk*) malletTwo{
    [self checkForCollisionsWithmallet:malletOne];
    
    [self checkForCollisionsWithmallet:malletTwo];
    

    if(imageView.frame.origin.x < maxFieldSize.origin.x || imageView.frame.origin.x + 2 * self.radius > maxFieldSize.origin.x  + maxFieldSize.size.width ){
        self.angle = -M_PI - self.angle;
    }
    
    if(imageView.frame.origin.y < maxFieldSize.origin.y || imageView.frame.origin.y + 2 * self.radius> maxFieldSize.origin.y  + maxFieldSize.size.height){
        int wallsToGoalDistance = (maxFieldSize.size.width - GOAL_SIZE) / 2;
        NSLog(@"Goals is from %f to %f", wallsToGoalDistance + maxFieldSize.origin.x, maxFieldSize.size.width - wallsToGoalDistance  + maxFieldSize.origin.x);
        if(imageView.frame.origin.x > wallsToGoalDistance + maxFieldSize.origin.x && imageView.frame.origin.x < maxFieldSize.size.width - wallsToGoalDistance  + maxFieldSize.origin.x){
            self.speed = 0.0;
            self.angle = 0.0;
           
            [self.game pointScoredForFirstPlayer:imageView.frame.origin.y < maxFieldSize.origin.y];

        }
        else{
            self.angle = -self.angle;
        }
            
 
    }
}



- (void) moveForElapsedTime: (double) elapsedTime{
    double newX = imageView.frame.origin.x + self.speed * cos(self.angle);
    double newY = imageView.frame.origin.y + self.speed * sin(self.angle);
    
    if(newX < maxFieldSize.origin.x - PUCK_OUTSIDE_OF_GAME_AREA_TOLERANCE) newX = maxFieldSize.origin.x;
    if(newX +  2 * self.radius > maxFieldSize.origin.x + maxFieldSize.size.width + PUCK_OUTSIDE_OF_GAME_AREA_TOLERANCE) newX = maxFieldSize.origin.x + maxFieldSize.size.width;
    if(newY < maxFieldSize.origin.y - PUCK_OUTSIDE_OF_GAME_AREA_TOLERANCE) newY = maxFieldSize.origin.y;
    if(newY + 2 * self.radius > maxFieldSize.origin.y + maxFieldSize.size.height + PUCK_OUTSIDE_OF_GAME_AREA_TOLERANCE) newY = maxFieldSize.origin.y + maxFieldSize.size.height;
    
    if (self.speed > MIN_SPEED) {
        imageView.frame= CGRectMake(newX, newY, imageView.frame.size.width, imageView.frame.size.height);
        self.speed -= FRICTION_PERCENTAGE*self.speed;  
    }
    else{
        self.speed = 0.0;
    }
}
@end
