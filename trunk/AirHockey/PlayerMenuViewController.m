//
//  PlayerMenuViewControler.m
//  AirHockey
//
//  Created by Seshiro on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayerMenuViewController.h"
#import "ViewController.h"
#import "MenuMalletImage.h"
@implementation PlayerMenuViewController


-(IBAction)showPlaygroundView
{
    ViewController* playView = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    playView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:playView animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{  
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    malletOneChoice = malletOneGreen;
    malletOneGreen.alpha = 0.5;
    malletTwoChoice = malletTwoBlue;
    malletTwoBlue.alpha = 0.5;

    
    MenuMalletImage* redOne = [[MenuMalletImage alloc] initWithImageView:malletOneRed forPlayerOne:YES];
    MenuMalletImage* greenOne = [[MenuMalletImage alloc] initWithImageView:malletOneGreen forPlayerOne:YES];
    MenuMalletImage* blueOne = [[MenuMalletImage alloc] initWithImageView:malletOneBlue forPlayerOne:YES];
    MenuMalletImage* yellowOne = [[MenuMalletImage alloc] initWithImageView:malletOneYellow forPlayerOne:YES];
    
    MenuMalletImage* redTwo = [[MenuMalletImage alloc] initWithImageView:malletTwoRed forPlayerOne:NO];
    MenuMalletImage* greenTwo = [[MenuMalletImage alloc] initWithImageView:malletTwoGreen forPlayerOne:NO];
    MenuMalletImage* blueTwo = [[MenuMalletImage alloc] initWithImageView:malletTwoBlue forPlayerOne:NO];
    MenuMalletImage* yellowTwo = [[MenuMalletImage alloc] initWithImageView:malletTwoYellow forPlayerOne:NO];
    
    
    UITapGestureRecognizer *tapOnRed = [[UITapGestureRecognizer alloc] initWithTarget:redOne action:@selector(selectedMallet:)];
    [malletOneRed addGestureRecognizer:tapOnRed];
    tapOnRed.delegate = self;
    
    UITapGestureRecognizer *tapOnBlue = [[UITapGestureRecognizer alloc] initWithTarget:blueOne action:@selector(selectedMallet:)];
    [malletOneBlue addGestureRecognizer:tapOnBlue];
    tapOnBlue.delegate = self;
    
    UITapGestureRecognizer *tapOnGreen = [[UITapGestureRecognizer alloc] initWithTarget:greenOne action:@selector(selectedMallet:)];
    [malletOneGreen addGestureRecognizer:tapOnGreen];
    tapOnGreen.delegate = self;
    
    UITapGestureRecognizer *tapOnYellow = [[UITapGestureRecognizer alloc] initWithTarget:yellowOne action:@selector(selectedMallet:)];
    [malletOneYellow addGestureRecognizer:tapOnYellow];
    tapOnYellow.delegate = self;
    
    //Tap Gesture recognizers for player two
    UITapGestureRecognizer *tapOnRed2 = [[UITapGestureRecognizer alloc] initWithTarget:redTwo
action:@selector(selectedMallet:)];
    [malletTwoRed addGestureRecognizer:tapOnRed2];
    tapOnRed2.delegate = self;
    
    UITapGestureRecognizer *tapOnBlue2 = [[UITapGestureRecognizer alloc] initWithTarget:blueTwo action:@selector(selectedMallet:)];
    [malletTwoBlue addGestureRecognizer:tapOnBlue2];
    tapOnBlue2.delegate = self;
    
    UITapGestureRecognizer *tapOnGreen2 = [[UITapGestureRecognizer alloc] initWithTarget:greenTwo action:@selector(selectedMallet:)];
    [malletTwoGreen addGestureRecognizer:tapOnGreen2];
    tapOnGreen2.delegate = self;
    
    UITapGestureRecognizer *tapOnYellow2 = [[UITapGestureRecognizer alloc] initWithTarget:yellowTwo action:@selector(selectedMallet:)];
    [malletTwoYellow addGestureRecognizer:tapOnYellow2];
    tapOnYellow2.delegate = self;
}



- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}



@end
