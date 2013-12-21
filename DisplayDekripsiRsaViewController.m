//
//  DisplayDekripsiRsaViewController.m
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/17/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "DisplayDekripsiRsaViewController.h"
#import "math.h"

@interface DisplayDekripsiRsaViewController ()

@end

@implementation DisplayDekripsiRsaViewController
//supaya dibuatkan getter dan setternya
@synthesize inputP = _inputP;
@synthesize inputQ = _inputQ;
@synthesize inputE = _inputE;
@synthesize inputC = _inputC;

-(double)findD : (double) input{
    double i;
    for(i = 0; i <= input+1 ;i++){
        if(fmod((i*_inputE),input) == 1){
            break;
        }
    }
    return i;
}

-(void)dekripRsa{
    double n = _inputP*_inputQ;
    double z = (_inputP-1)*(_inputQ-1);
    double d = (int)[self findD : z];
    NSLog(@"Isi d adalah %g",d);
    double m = pow(_inputC,d);
    NSLog(@"Isi dari hasil pow adalah %g",m);
    m = fmod(m,n);
    NSLog(@"Isi m adalah %g",m);
    NSLog(@"Isi n adalah %g",n);
    _labelM.text = [NSString stringWithFormat:@"%g",m];
    _labelSolusi.text = [NSString stringWithFormat:@"n = p*q = %d*%d\n\nm = (%d ^ %g) mod %g = %g",_inputP,_inputQ,_inputC,d,n,m];
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
    _labelC.text = [NSString stringWithFormat:@"%d",_inputC];
    [self dekripRsa];
}

@end
