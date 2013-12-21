//
//  DisplayEnkripsiCaesarCipherViewController.h
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/17/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayEnkripsiCaesarCipherViewController : UIViewController{
    NSMutableArray *solusi;
}

@property(strong,nonatomic) NSString *inputPlaintext;
@property (nonatomic) int inputJumlahPergeseran;

@property (weak, nonatomic) IBOutlet UILabel *labelRumusDasar;
@property (weak, nonatomic) IBOutlet UILabel *labelPlaintext;
@property (weak, nonatomic) IBOutlet UILabel *labelCiphertext;
@property (weak, nonatomic) IBOutlet UILabel *labelJumlahPergeseran;
- (IBAction)lihatSolusi:(id)sender;

@end
