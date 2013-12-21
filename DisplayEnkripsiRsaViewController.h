//
//  DisplayEnkripsiRsaViewController.h
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 10/17/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayEnkripsiRsaViewController : UIViewController

@property(nonatomic) int inputP;
@property(nonatomic) int inputQ;
@property(nonatomic) int inputE;
@property(nonatomic) int inputM;

@property (weak, nonatomic) IBOutlet UILabel *labelP;
@property (weak, nonatomic) IBOutlet UILabel *labelQ;
@property (weak, nonatomic) IBOutlet UILabel *labelE;
@property (weak, nonatomic) IBOutlet UILabel *labelM;
@property (weak, nonatomic) IBOutlet UILabel *labelSolusi;
@property (weak, nonatomic) IBOutlet UILabel *labelC;

@end
