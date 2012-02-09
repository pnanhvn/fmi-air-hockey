//
//  MenuMalletImage.m
//  AirHockey
//
//  Created by Seshiro on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuMalletImage.h"
#import "PlayerMenuViewController.h"

@implementation MenuMalletImage

-(id)initWithImageView: (UIImageView *) view forPlayerOne: (BOOL) isForPlayerOne_{
    self = [super init];
    if (self) {
        isForPlayerOne = isForPlayerOne_;
        selectedMallet = view;
        
    }
    return self;
}

-(void) selectedMallet:(UITapGestureRecognizer*) grec
{
    if(isForPlayerOne)
    {
        [malletOneChoice setImage: [selectedMallet image]];
    }
    else
    {
        [malletTwoChoice setImage: [selectedMallet image]];
    }
}

@end
