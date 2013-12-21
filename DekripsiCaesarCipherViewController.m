//
//  DekripsiCaesarCipherViewController.m
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/4/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "DekripsiCaesarCipherViewController.h"
#import "DisplayDekripsiCaesarCipherViewController.h"

@interface DekripsiCaesarCipherViewController ()

@end

@implementation DekripsiCaesarCipherViewController

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
    //baca input
    NSString *ciphertext = _textCiphertext.text;
    NSString *jumlahPergeseran = _textJumlahPergeseran.text;
    
    //cek semua input terisi sesuai dgn yang diminta
    if([ciphertext isEqualToString:@"" ] || [jumlahPergeseran isEqualToString:@""]){
        //tampilkan pesan input tidak boleh kosong
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terjadi Kesalahan" message:@"Semua input harus terisi" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else if(![jumlahPergeseran integerValue]){
        //tampilkan pesan input jumlah pergeseran harus angka
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terjadi Kesalahan" message:@"Inputan jumlah pergeseran harus angka" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else{
        //panggil segue
        [self performSegueWithIdentifier:@"showDekripsiCaesarCipher" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //baca input
    NSString *ciphertext = _textCiphertext.text;
    NSString *jumlahPergeseran = _textJumlahPergeseran.text;
    
    //kirimkan input ke controller tujuan
    DisplayDekripsiCaesarCipherViewController *ddccvc  = segue.destinationViewController;
    //set properti pada controller tujuan
    ddccvc.inputCiphertext = ciphertext;
    ddccvc.inputJumlahPergeseran = [jumlahPergeseran intValue];
}

@end
