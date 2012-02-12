//
//  ViewController.m
//  AirHockey
//
//  Created by Nikolay Dimitrov on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PlayerMenuViewController.h"
#import "Mallet.h"
#import "Puck.h"
	
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
    
    int maxWidth = self.view.frame.size.width;
    int maxHeight = self.view.frame.size.height;
    int midVertical = maxHeight / 2;
    
    
    
    Mallet *firstMalletDisk = [[Mallet alloc] initWithImageView:firstPlayerMallet andFieldSize:CGRectMake(0, midVertical, maxWidth, maxHeight - midVertical)];
    
    Mallet *secondMalletDisk = [[Mallet alloc] initWithImageView:secondPlayerMallet andFieldSize:CGRectMake(0, 0, maxWidth, midVertical)];
    
    Puck *puckDisk = [[Puck alloc] initWithImageView:puck andFieldSize:CGRectMake(0, 0, maxWidth, maxHeight)];
    
    game = [[Game alloc] initWithMalletOne:firstMalletDisk malletTwo:secondMalletDisk puck:puckDisk fieldSize: CGRectMake(0, 0, maxWidth, maxHeight)];
    [firstMalletDisk release];
    [secondMalletDisk release];
    [puckDisk release];
    
    game.firstPlayerPointsView = firstPlayerPointsView;
    game.secondPlayerPointsView = secondPlayerPointsView;
    [game resetGame];
 
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:game selector:@selector(timeElapsed) userInfo:nil repeats:YES];
    
    UITapGestureRecognizer *pauseTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToPlayerMenu:)];
    [pauseImg addGestureRecognizer:pauseTap];
    pauseTap.delegate = self;
    
    UITapGestureRecognizer *recon = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moveMalletOnTap:)];
    recon.delegate = self;
    [self.view addGestureRecognizer:recon];
    

    
}

- (void) moveMalletOnTap: (UITapGestureRecognizer *) recognizer{
    CGPoint location = [recognizer locationInView:self.view];
    [game tapOnGameScreenLocation:location];
}


- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

-(IBAction)goToPlayerMenu:(UITapGestureRecognizer*) grec
{
    game.pause = YES;
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
    [firstPlayerPointsView release];
    firstPlayerPointsView = nil;
    [secondPlayerPointsView release];
    secondPlayerPointsView = nil;
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
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (void)dealloc {
    [puck release];
    [firstPlayerMallet release];
    [secondPlayerMallet release];
    [firstPlayerPointsView release];
    [secondPlayerPointsView release];
    [super dealloc];
}
@end
