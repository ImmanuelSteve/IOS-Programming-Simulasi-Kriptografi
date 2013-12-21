//
//  DisplayDekripsiCaesarCipherViewController.m
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/17/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "DisplayDekripsiCaesarCipherViewController.h"
#import "DetailSolusiViewController.h"

//Constants
#define DEVISOR 26
#define LOWER_CASE_OFFSET 97
#define UPPER_CASE_OFFSET 65

@interface DisplayDekripsiCaesarCipherViewController ()

@end

@implementation DisplayDekripsiCaesarCipherViewController
//spy dibuat setter dan getter
@synthesize inputCiphertext = _inputCiphertext;
@synthesize inputJumlahPergeseran = _inputJumlahPergeseran;


-(void)dekripCaesar{
    int size = [_inputCiphertext length];
	unichar message[size];
	for (int i = 0; i < [_inputCiphertext length]; i++){
        char character = [_inputCiphertext characterAtIndex:i];
		message[i] = [self dekripChar : character : i];
	}
	_labelPlaintext.text = [[NSString alloc] initWithCharacters:message length:size];
    [solusi addObject:[NSString stringWithFormat:@"Dari hasil perhitungan diatas maka ditemukan hasil plaintextnya :\n\n %@",[[NSString alloc]initWithCharacters:message length:size]]];
}


-(unichar) dekripChar:(unichar) character : (int) i {
    
    unichar shiftedChar = character - _inputJumlahPergeseran;
    
    //if karakter lowercase a..z dan nilai dari shiftedChar positif
    if ((character > 96)&&(character<123)&&((shiftedChar-LOWER_CASE_OFFSET) >= 0)){
        shiftedChar = ((shiftedChar-LOWER_CASE_OFFSET)%DEVISOR)+LOWER_CASE_OFFSET;
       [solusi addObject:[NSString stringWithFormat:@"%d. %c -> %d \n    %c -> ((%d-%d)-%d) mod 26 +%d=%d ->%c\n",i+1,character,(int)character,character,(int)character,(int)_inputJumlahPergeseran,LOWER_CASE_OFFSET,LOWER_CASE_OFFSET,shiftedChar,shiftedChar]];
        return shiftedChar;
    }
    //else if karakter lowercase a..z dan nilai dari shiftedChar negatif
    //misal 94-96 mod 26 = 24
    else if ((character > 96)&&(character<123)) {
        shiftedChar = ((shiftedChar-LOWER_CASE_OFFSET+DEVISOR) % DEVISOR)+LOWER_CASE_OFFSET;
          [solusi addObject:[NSString stringWithFormat:@"%d. %c -> %d \n    %c -> (((%d-%d)-%d)+%d) mod 26 +%d=%d ->%c\n",i+1,character,(int)character,character,(int)character,(int)_inputJumlahPergeseran,LOWER_CASE_OFFSET,DEVISOR,LOWER_CASE_OFFSET,shiftedChar,shiftedChar]];
        return shiftedChar;
    }
    //else if karakter uppercase A..Z dan nilai dari shiftedChar positif
    else if ((character > 64)&&(character<91)&&((shiftedChar-LOWER_CASE_OFFSET) >= 0)) {
        shiftedChar = ((shiftedChar-UPPER_CASE_OFFSET)%DEVISOR)+UPPER_CASE_OFFSET;
        [solusi addObject:[NSString stringWithFormat:@"%d. %c -> %d \n    %c -> ((%d-%d)-%d) mod 26 +%d=%d ->%c\n",i+1,character,(int)character,character,(int)character,(int)_inputJumlahPergeseran,UPPER_CASE_OFFSET,UPPER_CASE_OFFSET,shiftedChar,shiftedChar]];
        return shiftedChar;
    }
    //else if karakter uppercase A..Z dan nilai dari shiftedChar negatif
    else if ((character > 64)&&(character<91)) {
        shiftedChar = ((shiftedChar-UPPER_CASE_OFFSET+DEVISOR)%DEVISOR)+UPPER_CASE_OFFSET;
        [solusi addObject:[NSString stringWithFormat:@"%d. %c -> %d \n    %c -> (((%d-%d)-%d)+%d) mod 26 +%d=%d ->%c\n",i+1,character,(int)character,character,(int)character,(int)_inputJumlahPergeseran,UPPER_CASE_OFFSET,DEVISOR,UPPER_CASE_OFFSET,shiftedChar,shiftedChar]];
        return shiftedChar;
    }
    //Jika tidak mendekrip karakter 
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

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"Isi dari input plainttext adalah : %@",_inputCiphertext);
    NSLog(@"Isi dari input jumlah pergeseran adalah : %d",_inputJumlahPergeseran);
    _labelRumusDasar.text = [NSString stringWithFormat:@"Jika ciphertext(x) antara a-z maka :\nD(x) = ((x-n)-65)mod 26 + 65\nJika ciphertext(x) antara A-Z maka :\nD(x) = ((x- n)-97)mod 26 + 97\nNOTE : \nJika hasil (x-n)-65 atau (x-n)-97 < 0\nmaka (hasil + 26) supaya menjadi positif"];
    _labelCiphertext.text = _inputCiphertext;
    _labelJumlahPergeseran.text = [NSString stringWithFormat:@"%d",_inputJumlahPergeseran];
    solusi = [[NSMutableArray alloc]init];
    //diket inputan dan rumus dasar
    [solusi addObject:[NSString stringWithFormat:@"Rumus Dasar :\n\nJika ciphertext(x) antara a-z maka :\nD(x) = ((x-n)-65)mod 26 + 65\nJika ciphertext(x) antara A-Z maka :\nD(x) = ((x- n)-97)mod 26 + 97\n"]];
    [solusi addObject:[NSString stringWithFormat:@"NOTE : \n\nJika hasil (x-n)-65 atau (x-n)-97 < 0\nmaka (hasil + 26) supaya menjadi positif"]];
    [solusi addObject:[NSString stringWithFormat:@"Diketahui :\nCiphertext : %@\nJumlah Pergeseran: %d\nJawab :",_inputCiphertext,_inputJumlahPergeseran]];
    [self dekripCaesar];
    NSLog(@"Isi dari showsolusi adalah : %@",solusi);
}

- (IBAction)lihatSolusi:(id)sender {
    [self performSegueWithIdentifier:@"showSolusiDekripsiCaesarCipher" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailSolusiViewController *dsvc = segue.destinationViewController;
    dsvc.solusi = solusi;
    dsvc.title = @"Solusi Dekripsi Caesar";
}

@end
