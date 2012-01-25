//
//  ViewController.m
//  AirHockey
//
//  Created by Nikolay Dimitrov on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

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
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveFirstPlayerMallet:)];
    [firstPlayerMallet addGestureRecognizer:recognizer];
    firstPlayerMallet.userInteractionEnabled = YES;
    
    
    
    recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveSecondPlayerMallet:)];
    [secondPlayerMallet addGestureRecognizer:recognizer];
    secondPlayerMallet.userInteractionEnabled = YES;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) moveFirstPlayerMallet:(UIPanGestureRecognizer *) sender{
    if(sender.state ==UIGestureRecognizerStateBegan){
        firstMalletX = sender.view.frame.origin.x;
        firstMalletY = sender.view.frame.origin.y;
    }
    
    CGPoint newLocation = [sender translationInView:self.view];
    sender.view.frame= CGRectMake(firstMalletX+newLocation.x, firstMalletY+ newLocation.y, sender.view.frame.size.width, sender.view.frame.size.height);
    NSLog(@"Move detected with position %f %f", newLocation.x,newLocation.y);
}

- (void) moveSecondPlayerMallet:(UIPanGestureRecognizer *) sender{
    if(sender.state ==UIGestureRecognizerStateBegan){
        secondMalletX = sender.view.frame.origin.x;
        secondMalletY = sender.view.frame.origin.y;
    }

    CGPoint newLocation = [sender translationInView:self.view];
    sender.view.frame= CGRectMake(secondMalletX+newLocation.x, secondMalletY+ newLocation.y, sender.view.frame.size.width, sender.view.frame.size.height);
    NSLog(@"Move detected with position %f %f", newLocation.x,newLocation.y);
}


- (void)viewDidUnload
{
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
    [firstPlayerMallet release];
    [secondPlayerMallet release];
    [super dealloc];
}
@end
