//
//  DekripsiVigenereViewController.h
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/4/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DekripsiVigenereViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textCiphertext;
@property (weak, nonatomic) IBOutlet UITextField *textKunci;
- (IBAction)ok:(id)sender;

@end
