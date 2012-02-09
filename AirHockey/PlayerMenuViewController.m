//
//  PlayerMenuViewControler.m
//  AirHockey
//
//  Created by Seshiro on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayerMenuViewController.h"
#import "ViewController.h"
@implementation PlayerMenuViewController

@synthesize playerOneName = _playerOneName;
@synthesize playerTwoName = _playerTwoName;

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
    UITapGestureRecognizer *tapOnRed = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedMalletOneWithImage:)];
    [malletOneRed addGestureRecognizer:tapOnRed];
    tapOnRed.delegate = self;
    
//    UITapGestureRecognizer *tapOnBlue = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedMalletOneWithImage:malletOneBlue:)];
 //   [malletOneRed addGestureRecognizer:tapOnBlue];
    
 //   UITapGestureRecognizer *tapOnGreen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedMalletOneWithImage:malletOneGreen:)];
 //   [malletOneGreen addGestureRecognizer:tapOnGreen];
    
  //  UITapGestureRecognizer *tapOnYellow = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedMalletOneWithImage:malletOneYellow:)];
  //  [malletOneYellow addGestureRecognizer:tapOnYellow];
}

-(void) selectedMalletOneWithImage:(UITapGestureRecognizer*) grec
{
 //   if(malletOneChoice != NULL){
  //      [malletOneChoice release];
  //      malletOneChoice = nil;
 //   }
   malletOneChoice = [[UIImageView alloc] initWithImage:[malletOneRed image]];
    UIImage img = [[UIImage alloc] initWithContentsOfFile:<#(NSString *)#> ] 
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
