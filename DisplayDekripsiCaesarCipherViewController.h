//
//  DisplayDekripsiCaesarCipherViewController.h
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/17/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayDekripsiCaesarCipherViewController : UIViewController{
    NSMutableArray *solusi;
}

@property(strong,nonatomic) NSString *inputCiphertext;
@property(nonatomic) int inputJumlahPergeseran;

@property (weak, nonatomic) IBOutlet UILabel *labelRumusDasar;
@property (weak, nonatomic) IBOutlet UILabel *labelCiphertext;
@property (weak, nonatomic) IBOutlet UILabel *labelJumlahPergeseran;
@property (weak, nonatomic) IBOutlet UILabel *labelPlaintext;
- (IBAction)lihatSolusi:(id)sender;

@end
