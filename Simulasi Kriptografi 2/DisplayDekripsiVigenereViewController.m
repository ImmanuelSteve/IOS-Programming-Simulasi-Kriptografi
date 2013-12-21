//
//  DisplayDekripsiVigenereViewController.m
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 11/2/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "DisplayDekripsiVigenereViewController.h"
#import "DetailSolusiViewController.h"

@interface DisplayDekripsiVigenereViewController ()

@end

@implementation DisplayDekripsiVigenereViewController
//supaya dibuatkan getter dan setter
@synthesize inputCiphertext = _inputCiphertext;
@synthesize inputKunci = _inputKunci;


-(void) dekripvigenere : (NSMutableString *) text : (NSMutableString *) kunci{
    int size = text.length;
    unichar message[size];
    for(int i = 0;i < text.length;i++){
        char charactertext = [text characterAtIndex:i];
        char characterkunci = [kunci characterAtIndex:i];
        if (charactertext > characterkunci) {
            message[i] = (charactertext - characterkunci) + 'A';
            NSLog(@"masuk if %d -> %c",i,message[i]);
            [solusi addObject:[NSString stringWithFormat:@"%d. Karena %c > %c maka :\n    text[%d] = (cipher[%d] - kunci[%d]) + A)\n    %c -> %d = (%d - %d)+65",i+1,charactertext,characterkunci,i,i,i,message[i],message[i],charactertext,characterkunci]];

        }
        else{
            char tampung = charactertext;
            char tampung1 =characterkunci;
            characterkunci -= 'A';
            message[i] = charactertext-characterkunci;
            NSLog(@"masuk else %d -> %c",i,message[i]);
            [solusi addObject:[NSString stringWithFormat:@"%d. Karena %c <= %c maka :\n    text[%d] = cipher[%d] - (kunci[%d] - A)\n    %c -> %d = %d - (%d-65)",i+1,tampung,tampung1,i,i,i,message[i],message[i],tampung,tampung1]];
            if(message[i] < 'A'){
                char tampung3 = message[i];
                message[i] = 'Z' - (characterkunci-(tampung-'@'));
                [solusi replaceObjectAtIndex:solusi.count-1 withObject:[NSString stringWithFormat:@"%d. Karena %c <= %c maka :\n    text[%d] = cipher[%d] - (kunci[%d] - A)\n    %c -> %d = %d - (%d-65)\n    Karena %c < A maka :\n    text[%d] = Z - (kunci[%d]-A - (cipher[%d] - @))\n    %c -> %d = 122 - ((%d-65) - (%d-64))",i+1,tampung,tampung1,i,i,i,tampung3,tampung3,tampung,tampung1,tampung3,i,i,i,message[i],message[i],characterkunci,tampung]];
                NSLog(@"masuk if dalam else %d -> %c",i,message[i]);
            }
        }
    }
    _labelPlaintext.text = [[NSString alloc]initWithCharacters:message length:size];
    [solusi addObject:[NSString stringWithFormat:@"Dari hasil perhitungan diatas maka ditemukan hasil plaintextnya :\n\n %@",[[NSString alloc]initWithCharacters:message length:size]]];
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
    _inputCiphertext = _inputCiphertext.uppercaseString;
    _inputKunci = _inputKunci.uppercaseString;
    
    //dibuat NSMutableString supaya bisa ditambah secara dinamis
    NSMutableString *text = [[NSMutableString alloc]initWithString:_inputCiphertext];
    NSMutableString *kunci = [[NSMutableString alloc]initWithString:_inputKunci];
    
    //samakan panjang kunci dengan text
    if (text.length > kunci.length) {
        int tamp = text.length - kunci.length;
        for (int i = 0; i<tamp; i++) {
            [kunci appendFormat:@"%c",[kunci characterAtIndex:i]];
        }
    }
    _labelCiphertext.text = text;
    _labelKunci.text = kunci;
    
    //set array solusi
    solusi = [[NSMutableArray alloc]init];
    //diketinputan
    [solusi addObject:[NSString stringWithFormat:@"Diketahui :\nCiphertext : %@\nKunci : %@\nJawab :",text,kunci]];
    [self dekripvigenere:text :kunci];
    
    NSLog(@"Isi dari input plainttext adalah : %@",text);
    NSLog(@"Isi dari input kunci adalah : %@",kunci);
    NSLog(@"Isi dari solusi adalah %@",solusi);
}

- (IBAction)lihatSolusi:(id)sender {
    [self performSegueWithIdentifier:@"showSolusiDekripsiVigenere" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailSolusiViewController *dsvc = segue.destinationViewController;
    dsvc.solusi = solusi;
    dsvc.title = @"Solusi Dekripsi Vigenere";
}

@end
