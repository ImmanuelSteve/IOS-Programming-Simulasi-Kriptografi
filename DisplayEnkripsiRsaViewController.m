//
//  DisplayEnkripsiRsaViewController.m
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/17/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "DisplayEnkripsiRsaViewController.h"

@interface DisplayEnkripsiRsaViewController ()

@end

@implementation DisplayEnkripsiRsaViewController
//supaya dibuatkan getter dan setternya
@synthesize inputP = _inputP;
@synthesize inputQ = _inputQ;
@synthesize inputE = _inputE;
@synthesize inputM = _inputM;

-(void)enkripRsa{
    double n = _inputP*_inputQ;
    double c = pow(_inputM,_inputE);
    c = fmod(c,n);
    NSLog(@"Isi c adalah %g",c);
    _labelC.text = [NSString stringWithFormat:@"%g",c];
    _labelSolusi.text = [NSString stringWithFormat:@"n = p*q = %d*%d\n\nc = (%d ^ %d) mod %g = %g",_inputP,_inputQ,_inputM,_inputE,n,c];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _labelP.text = [NSString stringWithFormat:@"%d",_inputP];
     _labelQ.text = [NSString stringWithFormat:@"%d",_inputQ];
     _labelE.text = [NSString stringWithFormat:@"%d",_inputE];
     _labelM.text = [NSString stringWithFormat:@"%d",_inputM];
    [self enkripRsa];
}

@end
