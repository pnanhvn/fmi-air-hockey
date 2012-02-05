//
//  Puck.m
//  AirHockey
//
//  Created by Seshiro on 2/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayDisk.h"

@implementation PlayDisk

@synthesize center;
@synthesize angle;
@synthesize speed;
@synthesize radius;

- (id)initWithImageView: (UIImageView *) view andFieldSize: (CGRect) fieldSize {
    self = [super init];
    if (self) {
        center = view.frame.origin;
        angle = 0.0;
        speed = 0.0;
        imageView = view;
        maxFieldSize = fieldSize;
        self.radius = view.frame.size.height / 2;
    }
    return self;
}

@end
