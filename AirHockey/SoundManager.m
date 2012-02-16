//
//  SoundManager.m
//  AirHockey
//
//  Created by Seshiro on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SoundManager.h"

@implementation SoundManager

- (id)init {
    self = [super init];
    if (self) {
        wallHitSound = CFBundleCopyResourceURL(mainBundle, (CFStringRef) @"wall", CFSTR ("mp3"), nil);
        malletHitSound = CFBundleCopyResourceURL(mainBundle, (CFStringRef) @"mallet", CFSTR ("mp3"), nil);
        AudioServicesCreateSystemSoundID(wallHitSound, &wallHitSoundID);
        AudioServicesCreateSystemSoundID(malletHitSound, &malletHitSoundID);
        
    }
    return self;
}

+ (SoundManager *)getInstance
{
    static SoundManager *sharedSingleton;
    
    @synchronized(self)
    {
        if (!sharedSingleton)
            sharedSingleton = [[SoundManager alloc] init];
        
        return sharedSingleton;
    }
}

-(void) playPuckHitWall{
    AudioServicesPlaySystemSound(wallHitSoundID);    
}
-(void) playPuckHitMallet{
    AudioServicesPlaySystemSound(malletHitSoundID);    
}

-(void)dealloc{

}

@end
