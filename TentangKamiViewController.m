//
//  TentangKamiViewController.m
//  Simulasi Kriptografi 2
//
//  Created by ImmanuelSteve on 5/12/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "TentangKamiViewController.h"
#import "TentangWebsiteViewController.h"

@interface TentangKamiViewController ()

@end

@implementation TentangKamiViewController

NSString *tentangkamiURLString;

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

- (IBAction)tentangKami:(id)sender {
    tentangkamiURLString = [NSString stringWithFormat:@"http://m.facebook.com/immanuel.steve"];
    [self performSegueWithIdentifier:@"showWebsite" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showWebsite"]) {
        TentangWebsiteViewController *twvc = segue.destinationViewController;
        twvc.tentangkamiURLString = tentangkamiURLString;
    }
}
@end
