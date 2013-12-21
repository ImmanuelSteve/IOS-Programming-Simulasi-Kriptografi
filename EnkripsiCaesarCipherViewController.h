//
//  EnkripsiCaesarCipherViewController.h
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/4/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnkripsiCaesarCipherViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textPlaintext;
@property (weak, nonatomic) IBOutlet UITextField *textJumlahPergeseran;
- (IBAction)ok:(id)sender;

@end
