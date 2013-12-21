//
//  DekripsiVigenereViewController.m
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/4/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "DekripsiVigenereViewController.h"
#import "DisplayDekripsiVigenereViewController.h"

@interface DekripsiVigenereViewController ()

@end

@implementation DekripsiVigenereViewController

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
    NSString *ciphertext = _textCiphertext.text;
    NSString *kunci = _textKunci.text;
    
    //cek semua input terisi dengan yang diminta
    if([ciphertext isEqualToString:@""] || [kunci isEqualToString:@""]){
        //tampilkan pesan input tidak boleh kosong
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terjadi Kesalahan" message:@"Semua input harus terisi" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else if([self check : kunci]>0 ||[self check:ciphertext]>0){
        //tampilkan pesan element string kunci harus karakter semua
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terjadi Kesalahan" message:@"Semua element inputan harus karakter" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else{
        //panggil segue
        [self performSegueWithIdentifier:@"showDekripsiVigenere" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //baca inputan user
    NSString *ciphertext = _textCiphertext.text;
    NSString *kunci = _textKunci.text;
    
    //kirimkan input ke controller tujuan
    DisplayDekripsiVigenereViewController *ddvvc = segue.destinationViewController;
    
    //set properti pada controller tujuan
    ddvvc.inputCiphertext = ciphertext;
    ddvvc.inputKunci = kunci;
    
}

@end
