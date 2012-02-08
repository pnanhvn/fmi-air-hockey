//
//  Mallet.h
//  AirHockey
//
//  Created by Nikolay Dimitrov on 2/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayDisk.h"

@interface Mallet : PlayDisk{
    double xAtGestureBegin;
    double yAtGestureBegin;
}
- (void) moveToPositionX: (double) x Y: (double) y;
@end
