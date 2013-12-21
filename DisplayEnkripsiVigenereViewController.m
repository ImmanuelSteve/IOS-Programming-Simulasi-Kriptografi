//
//  DisplayEnkripsiVigenereViewController.m
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 11/2/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "DisplayEnkripsiVigenereViewController.h"
#import "DetailSolusiViewController.h"

@interface DisplayEnkripsiVigenereViewController ()

@end

@implementation DisplayEnkripsiVigenereViewController
//supaya dibuatkan getter dan setter
@synthesize inputPlaintext = _inputPlaintext;
@synthesize inputKunci = _inputKunci;

-(void) enkripvigenere : (NSMutableString *) text : (NSMutableString *) kunci{
    int size = text.length;
    unichar message[size];
    for(int i = 0;i < text.length;i++){
        char charactertext = [text characterAtIndex:i];
        char characterkunci = [kunci characterAtIndex:i];
        message[i] = charactertext + (characterkunci - 'A');
        [solusi addObject:[NSString stringWithFormat:@"%d. cipher[%d] = text[%d] + (kunci[%d] - A)\n    %c -> %d = %d + (%d-65)",i+1,i,i,i,message[i],message[i],charactertext,characterkunci]];
        if(message[i] > 'Z'){
            char tampung = charactertext;
            char tampung1 = message[i];
            charactertext = message[i] - '[';
            message[i] = charactertext + 'A';
            [solusi replaceObjectAtIndex:solusi.count-1 withObject:[NSString stringWithFormat:@"%d. cipher[%d] = text[%d] + (kunci[%d] - A)\n    %c -> %d = %d + (%d-65)\n    karena %c > Z maka :\n    cipher[%d] = (cipher[%d]- [) + A\n    %c -> %d = (%d - 91) + 65",i+1,i,i,i,tampung1,tampung1,tampung,characterkunci,tampung1,i,i,message[i],message[i],tampung1]];
        }
    }
    _labelCiphertext.text = [[NSString alloc]initWithCharacters:message length:size];
    [solusi addObject:[NSString stringWithFormat:@"Dari hasil perhitungan diatas maka ditemukan hasil ciphertextnya :\n\n %@",[[NSString alloc]initWithCharacters:message length:size]]];
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
    [super viewWillAppear:animated];
    _inputPlaintext = _inputPlaintext.uppercaseString;
    _inputKunci = _inputKunci.uppercaseString;
    
    //dibuat NSMutableString supaya bisa ditambah secara dinamis
    NSMutableString *text = [[NSMutableString alloc]initWithString:_inputPlaintext];
    NSMutableString *kunci = [[NSMutableString alloc]initWithString:_inputKunci];
    
    //samakan panjang kunci dengan text
    if (text.length > kunci.length) {
        int tamp = text.length - kunci.length;
        for (int i = 0; i<tamp; i++) {
            [kunci appendFormat:@"%c",[kunci characterAtIndex:i]];
        }
    }
    _labelPlaintext.text = text;
    _labelKunci.text = kunci;
    
    //set array solusi
    solusi = [[NSMutableArray alloc]init];
    //diketinputan
    [solusi addObject:[NSString stringWithFormat:@"Diketahui :\nPlaintext : %@\nKunci : %@\nJawab :",text,kunci]];
    
    [self enkripvigenere:text:kunci];
    
    NSLog(@"Isi dari input plainttext adalah : %@",text);
    NSLog(@"Isi dari input kunci adalah : %@",kunci);
    NSLog(@"Isi dari solusi adalah %@",solusi);
}

- (IBAction)lihatSolusi:(id)sender {
    [self performSegueWithIdentifier:@"showSolusiEnkripsiVigenere" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailSolusiViewController *dsvc = segue.destinationViewController;
    dsvc.solusi = solusi;
    dsvc.title = @"Solusi Enkripsi Vigenere";
}

@end
