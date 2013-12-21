//
//  DetailBantuanViewController.m
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 11/2/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "DetailBantuanViewController.h"

@interface DetailBantuanViewController ()

@end

@implementation DetailBantuanViewController
//supaya dibuatkan getter dan setter
@synthesize bantuanArray = _bantuanArray;
@synthesize bantuanIndex = _bantuanIndex;

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
    //ambil vocab dulu
    NSDictionary *bantuan = [_bantuanArray objectAtIndex:_bantuanIndex];
    _labelKunci.text = [bantuan objectForKey:@"kunci"];
    _textPenjelasan.text = [bantuan objectForKey:@"penjelasan"];
    [self resignFirstResponder];
}

@end
