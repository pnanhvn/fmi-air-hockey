//
//  Puck.m
//  AirHockey
//
//  Created by Seshiro on 2/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayDisk.h"

@implementation PlayDisk

@synthesize angle;
@synthesize speed;
@synthesize radius;

- (id)initWithImageView: (UIImageView *) view andFieldSize: (CGRect) fieldSize {
    self = [super init];
    if (self) {
        angle = 0.0;
        speed = 0.0;
        imageView = view;
        maxFieldSize = fieldSize;
        self.radius = view.frame.size.height / 2;
        startPosition = view.frame;
    }
    return self;
}

- (CGPoint) getCenter{
    return CGPointMake(imageView.frame.origin.x + imageView.frame.size.width/2, imageView.frame.origin.y + imageView.frame.size.height/2);
}

- (void) moveToStart{
    imageView.frame = startPosition;
}



@end
