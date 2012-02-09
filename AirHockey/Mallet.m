//
//  Mallet.m
//  AirHockey
//
//  Created by Nikolay Dimitrov on 2/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Mallet.h"

@implementation Mallet

- (id)initWithImageView: (UIImageView *) view andFieldSize: (CGRect) fieldSize {
    self = [super initWithImageView:view andFieldSize:fieldSize];
    if (self) {
        UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveMalletFromGestureRecognizer:)];
        [view addGestureRecognizer:recognizer];
        [recognizer release];
        view.userInteractionEnabled = YES;
    }
    return self;
}
- (CGPoint) moveAtCoordinatesX: (double) x Y: (double) y{
    if(x < maxFieldSize.origin.x) x = maxFieldSize.origin.x;
    if(x > maxFieldSize.origin.x + maxFieldSize.size.width - imageView.frame.size.width) x = maxFieldSize.origin.x + maxFieldSize.size.width  - imageView.frame.size.width;
    
    if(y < maxFieldSize.origin.y) y = maxFieldSize.origin.y;
    if(y > maxFieldSize.origin.y + maxFieldSize.size.height - imageView.frame.size.height) y =  maxFieldSize.origin.y + maxFieldSize.size.height -  imageView.frame.size.width;
    
    imageView.frame= CGRectMake(x, y, imageView.frame.size.width, imageView.frame.size.height);    
    return CGPointMake(x, y);
}

- (void) moveMalletFromGestureRecognizer:(UIPanGestureRecognizer *) sender{
    if(sender.state ==UIGestureRecognizerStateBegan){
        xAtGestureBegin = sender.view.frame.origin.x;
        yAtGestureBegin = sender.view.frame.origin.y;
    }
    
    if(sender.state == UIGestureRecognizerStateEnded){
        self.speed = 0;
    }
    else{
        self.speed = ((abs([sender velocityInView:imageView.superview].x) + abs([sender velocityInView:imageView.superview].y))/100);
    }
    //NSLog(@"%f,%f", [sender velocityInView:imageView.superview].x, [sender velocityInView:imageView.superview].y);
    
    CGPoint newLocation = [sender translationInView:imageView.superview];
    double X = xAtGestureBegin + newLocation.x;
    double Y = yAtGestureBegin + newLocation.y;
    [self moveAtCoordinatesX:X Y:Y];
    
    
    
}

- (void) moveToPositionX: (double) x Y: (double) y{
    self.speed = 5.0;
    [self moveAtCoordinatesX:x - self.radius Y:y - self.radius];
}

- (void) moveToStart{
    UIPanGestureRecognizer *recognizer = [[imageView gestureRecognizers] objectAtIndex:0];
    [imageView removeGestureRecognizer:recognizer];
    [super moveToStart];
    
    recognizer = [[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveMalletFromGestureRecognizer:)]autorelease];
    [imageView addGestureRecognizer:recognizer];
    //[imageView addGestureRecognizer:recon];
}
@end
