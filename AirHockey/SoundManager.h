//
//  SoundManager.h
//  AirHockey
//
//  Created by Seshiro on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface SoundManager : NSObject{
    //CFBundleRef mainBundle;
    //CFURLRef wallHitSound;
    //CFURLRef malletHitSound;
    //UInt32 wallHitSoundID;
    //UInt32 malletHitSoundID;


}    

//+ (SoundManager *)getInstance;
+(void) playPuckHitWall;
+(void) playPuckHitMallet;

@end
