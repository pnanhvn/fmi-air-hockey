//
//  ViewController.m
//  AirHockey
//
//  Created by Nikolay Dimitrov on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PlayerMenuViewController.h"
#import "ScreenConstants.h"
	
@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [firstPlayerMallet setImage:[malletOneChoice image]];
    [secondPlayerMallet setImage:[malletTwoChoice image]];
    
    firstMalletDisk = [[Mallet alloc] initWithImageView:firstPlayerMallet andFieldSize:CGRectMake(0, midVertical, maxWidth, maxHeight - midVertical)];
    
    secondMalletDisk = [[Mallet alloc] initWithImageView:secondPlayerMallet andFieldSize:CGRectMake(0, 0, maxWidth, midVertical)];
    
    puckDisk = [[Puck alloc] initWithImageView:puck andFieldSize:CGRectMake(0, 0, maxWidth, maxHeight)];
    
 
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(movePuck) userInfo:nil repeats:YES];
    UITapGestureRecognizer *recon = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moveMalletOnTap:)];
    recon.delegate = self;
    [self.view addGestureRecognizer:recon];
    
}

- (void) moveMalletOnTap: (UITapGestureRecognizer *) recognizer{
    CGPoint location = [recognizer locationInView:self.view];
    NSLog(@"%f", location.y);
    if(location.y > maxHeight / 2 ){
        [firstMalletDisk moveToPositionX:location.x Y:location.y];
    }
    else{
        [secondMalletDisk moveToPositionX:location.x Y:location.y];
    }
}

- (void) movePuck {

    [puckDisk checkForCollisionsWithMulletOne:firstMalletDisk andMulletTwo:secondMalletDisk];
    [puckDisk moveForElapsedTime: 0.1];
}

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

-(IBAction)goToPlayerMenu
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [puck release];
    puck = nil;
    [firstPlayerMallet release];
    firstPlayerMallet = nil;
    [secondPlayerMallet release];
    secondPlayerMallet = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
 
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)dealloc {
    [puck release];
    [firstPlayerMallet release];
    [secondPlayerMallet release];
    [super dealloc];
}
@end
