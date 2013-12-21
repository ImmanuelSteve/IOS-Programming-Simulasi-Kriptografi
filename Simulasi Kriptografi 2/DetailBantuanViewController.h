//
//  DetailBantuanViewController.h
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 11/2/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailBantuanViewController : UIViewController

@property(strong,nonatomic)NSMutableArray *bantuanArray;
@property (nonatomic) int bantuanIndex;

@property (weak, nonatomic) IBOutlet UILabel *labelKunci;
@property (weak, nonatomic) IBOutlet UITextView *textPenjelasan;


@end
