//
//  DetailSolusiViewController.m
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 5/11/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "DetailSolusiViewController.h"
#import "SolusiCell.h"

@interface DetailSolusiViewController ()

@end

@implementation DetailSolusiViewController
//supaya dibuatkan getter dan setter
@synthesize solusi = _solusi;

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

//berapa row
-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _solusi.count;
}

//isi dari setiap cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *solusicell = [_solusi objectAtIndex:indexPath.row];
    
    static NSString *cellIdentifier = @"myCell";
    
    //ambil cell yang tidak terpakai/recycle
    SolusiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //isikan label dari cell tsb
    cell.labelSolusi.text = solusicell;
    //return cell untuk diproses
    return cell;
}

@end
