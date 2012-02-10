//
//  PointsView.m
//  AirHockey
//
//  Created by Nikolay Dimitrov on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PointsView.h"

@implementation PointsView
- (void) showPoints: (int) points{
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d", points] ofType:@"png"];
    self.image = [UIImage imageWithContentsOfFile: path];
}
@end
