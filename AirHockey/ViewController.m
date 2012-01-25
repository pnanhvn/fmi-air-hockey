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

- (CGPoint) moveView: (UIView *) view AtCoordinatesX: (double) x Y: (double) y forFirstMallet: (Boolean) first{
    if(x < 0) x = 0;
    if(x > 768 - view.frame.size.width) x = 768  - view.frame.size.width;
    
    if(!first){    
        if(y < 0) y = 0;
        if(y > 502 - view.frame.size.height) y =  502 - view.frame.size.height;
    }
    else{
        if(y < 502) y = 502;
        if(y > 1004 - view.frame.size.height) y =  1004  - view.frame.size.height;

    }
    
    view.frame= CGRectMake(x, y, view.frame.size.width, view.frame.size.height);
    
    return CGPointMake(x, y);
}

- (void) moveFirstPlayerMallet:(UIPanGestureRecognizer *) sender{
    if(sender.state ==UIGestureRecognizerStateBegan){
        firstMalletX = sender.view.frame.origin.x;
        firstMalletY = sender.view.frame.origin.y;
    }
    
    
    CGPoint newLocation = [sender translationInView:self.view];
    double X = firstMalletX + newLocation.x;
    double Y = firstMalletY + newLocation.y;
    [self moveView:sender.view
    AtCoordinatesX:X Y:Y forFirstMallet:YES];
    NSLog(@"Speed is x: %f y: %f", [sender velocityInView:self.view].x, [sender velocityInView:self.view].y);

}

- (void) moveSecondPlayerMallet:(UIPanGestureRecognizer *) sender{
    if(sender.state ==UIGestureRecognizerStateBegan){
        secondMalletX = sender.view.frame.origin.x;
        secondMalletY = sender.view.frame.origin.y;
    }
    
    CGPoint newLocation = [sender translationInView:self.view];
    double X = secondMalletX + newLocation.x;
    double Y = secondMalletY + newLocation.y;
    [self moveView:sender.view
    AtCoordinatesX:X Y:Y forFirstMallet:NO];
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
