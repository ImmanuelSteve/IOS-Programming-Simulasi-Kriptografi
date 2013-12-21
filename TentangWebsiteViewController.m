//
//  TentangWebsiteViewController.m
//  Simulasi Kriptografi 2
//
//  Created by ImmanuelSteve on 5/12/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "TentangWebsiteViewController.h"

@interface TentangWebsiteViewController ()

@end

@implementation TentangWebsiteViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSURL *tentangURL = [NSURL URLWithString:_tentangkamiURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:tentangURL];
    NSLog(@"%@",request);
    [_webView loadRequest:request];
}

@end
