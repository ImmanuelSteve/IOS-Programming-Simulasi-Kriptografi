//
//  TentangWebsiteViewController.h
//  Simulasi Kriptografi 2
//
//  Created by ImmanuelSteve on 5/12/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TentangWebsiteViewController : UIViewController

@property(strong, nonatomic)NSString *tentangkamiURLString;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
