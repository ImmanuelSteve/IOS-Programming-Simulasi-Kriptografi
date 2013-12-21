//
//  EnkripsiVigenereViewController.m
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/4/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "EnkripsiVigenereViewController.h"
#import "DisplayEnkripsiVigenereViewController.h"

@interface EnkripsiVigenereViewController ()

@end

@implementation EnkripsiVigenereViewController

-(int)check : (NSString *) text{
    int counter = 0;
    for(int i = 0; i<text.length;i++){
        if(([text characterAtIndex:i ]>64 && [text characterAtIndex:i ]<91) ||([text characterAtIndex:i ]>96 && [text characterAtIndex:i ]<123)){
        }
        else{
            counter++;
        }
    }
    return counter;
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

- (IBAction)ok:(id)sender {
    //baca inputan user
    NSString *plaintext = _textPlaintext.text;
    NSString *kunci = _textKunci.text;
    
    //cek semua input terisi dengan yang diminta
    if([plaintext isEqualToString:@""] || [kunci isEqualToString:@""]){
        //tampilkan pesan input tidak boleh kosong
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terjadi Kesalahan" message:@"Semua input harus terisi" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else if([self check : kunci]>0 ||[self check:plaintext]>0){
        //tampilkan pesan element string kunci harus karakter semua
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terjadi Kesalahan" message:@"Semua element inputan harus karakter" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else{
        //panggil segue
        [self performSegueWithIdentifier:@"showEnkripsiVigenere" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //baca inputan user
    NSString *plaintext = _textPlaintext.text;
    NSString *kunci = _textKunci.text;
    
    //kirimkan input ke controller tujuan
    DisplayEnkripsiVigenereViewController *devvc = segue.destinationViewController;
    
    //set properti pada controller tujuan
    devvc.inputPlaintext = plaintext;
    devvc.inputKunci = kunci;
    
}

@end
