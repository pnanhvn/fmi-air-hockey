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
        view.userInteractionEnabled = YES;
    }
    return self;
}
- (CGPoint) moveView: (UIView *) view AtCoordinatesX: (double) x Y: (double) y forFirstMallet: (Boolean) first{
    if(x < maxFieldSize.origin.x) x = maxFieldSize.origin.x;
    if(x > maxFieldSize.origin.x + maxFieldSize.size.width - view.frame.size.width) x = maxFieldSize.origin.x + maxFieldSize.size.width  - view.frame.size.width;
    
    if(y < maxFieldSize.origin.y) y = maxFieldSize.origin.y;
    if(y > maxFieldSize.origin.y + maxFieldSize.size.height - view.frame.size.height) y =  maxFieldSize.origin.y + maxFieldSize.size.height -  view.frame.size.width;
    
    view.frame= CGRectMake(x, y, view.frame.size.width, view.frame.size.height);
    
    return CGPointMake(x, y);
}

- (void) moveMalletFromGestureRecognizer:(UIPanGestureRecognizer *) sender{
    if(sender.state ==UIGestureRecognizerStateBegan){
        xAtGestureBegin = sender.view.frame.origin.x;
        yAtGestureBegin = sender.view.frame.origin.y;
    }
    
    
    CGPoint newLocation = [sender translationInView:imageView.superview];
    double X = xAtGestureBegin + newLocation.x;
    double Y = yAtGestureBegin + newLocation.y;
    [self moveView:sender.view
    AtCoordinatesX:X Y:Y forFirstMallet:YES];
}
@end
