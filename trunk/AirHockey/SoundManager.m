//
//  SoundManager.m
//  AirHockey
//
//  Created by Seshiro on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SoundManager.h"

@implementation SoundManager

+(void) playPuckHitWall{
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    CFURLRef soundFileURLRef;
    soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) @"wall", CFSTR ("mp3"), nil);
    UInt32 soundID;
    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
    AudioServicesPlaySystemSound(soundID);    
}
+(void) playPuckHitMallet{
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    CFURLRef soundFileURLRef;
    soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) @"mallet", CFSTR ("mp3"), nil);
    UInt32 soundID;
    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
    AudioServicesPlaySystemSound(soundID);    
}

@end
