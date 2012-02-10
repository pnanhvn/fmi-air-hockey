//
//  MenuMalletImage.h
//  AirHockey
//
//  Created by Seshiro on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuMalletImage : NSObject
{
    UIImageView* selectedMallet;
    BOOL isForPlayerOne;
}


-(id)initWithImageView: (UIImageView *) view forPlayerOne: (BOOL) isForPlayerOne_;
-(void) selectedMallet:(UITapGestureRecognizer*) grec;
@end
