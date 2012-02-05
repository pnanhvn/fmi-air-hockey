//
//  Puck.h
//  AirHockey
//
//  Created by Seshiro on 2/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayDisk : NSObject{
    UIImageView *imageView;
    CGRect maxFieldSize;
}

@property CGPoint center;
@property double angle;
@property double speed;


- (id)initWithImageView: (UIImageView *) view andFieldSize: (CGRect) fieldSize;
@end
