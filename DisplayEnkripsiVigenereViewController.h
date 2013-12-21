//
//  DisplayEnkripsiVigenereViewController.h
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 11/2/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayEnkripsiVigenereViewController : UIViewController{
    NSMutableArray *solusi;
}

@property(strong,nonatomic) NSString *inputPlaintext;
@property(strong,nonatomic) NSString *inputKunci;

@property (weak, nonatomic) IBOutlet UILabel *labelPlaintext;
@property (weak, nonatomic) IBOutlet UILabel *labelKunci;
@property (weak, nonatomic) IBOutlet UILabel *labelCiphertext;
- (IBAction)lihatSolusi:(id)sender;

@end
