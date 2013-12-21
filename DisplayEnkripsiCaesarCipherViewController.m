//
//  DisplayEnkripsiCaesarCipherViewController.m
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/17/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "DisplayEnkripsiCaesarCipherViewController.h"
#import "DetailSolusiViewController.h"

//Constants
#define DEVISOR 26
#define LOWER_CASE_OFFSET 97
#define UPPER_CASE_OFFSET 65


@interface DisplayEnkripsiCaesarCipherViewController ()

@end

@implementation DisplayEnkripsiCaesarCipherViewController
//spy dibuat getter dan setter
@synthesize inputPlaintext = _inputPlaintext;
@synthesize inputJumlahPergeseran = _inputJumlahPergeseran;



-(void)enkripCaesar{
    int size = [_inputPlaintext length];
    unichar message[size];
    for(int i = 0;i < [_inputPlaintext length];i++){
        char character = [_inputPlaintext characterAtIndex:i];
        message[i] = [self enkripChar : character : i];
    }
    _labelCiphertext.text = [[NSString alloc]initWithCharacters:message length:size];
    [solusi addObject:[NSString stringWithFormat:@"Dari hasil perhitungan diatas maka ditemukan hasil ciphertextnya :\n\n %@",[[NSString alloc]initWithCharacters:message length:size]]];
}

-(unichar)enkripChar:(unichar)character : (int) i{
    unichar shiftedChar = character + _inputJumlahPergeseran;
    
    //If character is lowercase a..z
    if ((character > 96)&&(character<123)){
        shiftedChar = ((shiftedChar-LOWER_CASE_OFFSET)%DEVISOR)+LOWER_CASE_OFFSET;
        [solusi addObject:[NSString stringWithFormat:@"%d. %c -> %d \n    %c = (%d+%d)-%d mod 26 + %d = %d -> %c\n",i+1,character,(int)character,character,(int)character,(int)_inputJumlahPergeseran,LOWER_CASE_OFFSET,LOWER_CASE_OFFSET,shiftedChar,shiftedChar]];
        return shiftedChar;
    }
    //Else if character is captital A..Z
    else if ((character > 64)&&(character<91)){
        shiftedChar = ((shiftedChar-UPPER_CASE_OFFSET)%DEVISOR)+UPPER_CASE_OFFSET;
       [solusi addObject:[NSString stringWithFormat:@"%d. %c -> %d \n    %c = (%d+%d)-%d mod 26 + %d = %d -> %c\n",i+1,character,(int)character,character,(int)character,(int)_inputJumlahPergeseran,UPPER_CASE_OFFSET,UPPER_CASE_OFFSET,shiftedChar,shiftedChar]];
        return shiftedChar;
    }
    //Else do not encrypt character
    else {
        [solusi addObject:[NSString stringWithFormat:@"%d. '%c' karena bukan karakter maka tetap",i+1,character]];
        return character;
    }

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

//memasukkan data sebelum view ditampilkan
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"Isi dari input plainttext adalah : %@",_inputPlaintext);
    NSLog(@"Isi dari input jumlah pergeseran adalah : %d",_inputJumlahPergeseran);
    _labelRumusDasar.text = [NSString stringWithFormat:@"Jika plaintext(x) antara a-z maka :\nE(x) = ((x+n)-65)mod 26 + 65\nJika plaintext(x) antara A-Z maka :\nE(x) = ((x+ n)-97)mod 26 + 97\n"];
    _labelPlaintext.text = _inputPlaintext;
    _labelJumlahPergeseran.text = [NSString stringWithFormat:@"%d",_inputJumlahPergeseran];
    solusi = [[NSMutableArray alloc]init];
    //diket inputan dan rumus dasar
    [solusi addObject:[NSString stringWithFormat:@"Rumus Dasar :\n\nJika plaintext(x) antara a-z maka :\nE(x) = ((x+n)-65)mod 26 + 65\nJika plaintext(x) antara A-Z maka :\nE(x) = ((x+ n)-97)mod 26 + 97"]];
    [solusi addObject:[NSString stringWithFormat:@"Diketahui :\nPlaintext : %@\nJumlah Pergeseran: %d\nJawab :",_inputPlaintext,_inputJumlahPergeseran]];

    [self enkripCaesar];
    NSLog(@"Isi dari showsolusi adalah : %@",solusi);
    
}

- (IBAction)lihatSolusi:(id)sender {
    [self performSegueWithIdentifier:@"showSolusiEnkripsiCaesarCipher" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailSolusiViewController *dsvc = segue.destinationViewController;
    dsvc.solusi = solusi;
    dsvc.title = @"Solusi Enkripsi Caesar";
    
}

@end
