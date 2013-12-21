//
//  BantuanViewController.m
//  Simulasi Kriptografi 2
//
//  Created by Steven Renaldo Antony on 11/2/13.
//  Copyright (c) 2013 Steven Renaldo Antony (71110054). All rights reserved.
//

#import "BantuanViewController.h"
#import "DetailBantuanViewController.h"

@interface BantuanViewController ()

@end

@implementation BantuanViewController
int selectedIndex;

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
    //load data dari vocabs.plist
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"bantuan" ofType:@"plist"];
    bantuanArray = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
}

//implements data source
//1.ada berapa section? defaultnya 1
-(int)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//2.ada berapa baris -> baca jumlah data di array
-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return bantuanArray.count;
}

//implements delegate
//1.mengisi setiap cell dengan data yang kita miliki
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //definisikan identifier dari cellnya(sama dengan identifier yang didefinisikan di storyboard
    static NSString *cellIdentifier = @"bantuan";
    
    //reuse cell yang sudah tidak terlihat
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //set accessory type
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //baca/ambil data dari array pada index sesuai posisi cell sekarang pada baris keberapa. Baris keberapa = indexPath.row
    NSDictionary *bantuan = [bantuanArray objectAtIndex:indexPath.row];
    
    //tampilkan di cell
    cell.textLabel.text=[NSString stringWithFormat:@"%@",[bantuan objectForKey:@"kunci"]];
    cell.detailTextLabel.text= @"";
    return cell;
}

//2.apa yangdilakukan jika salah satu cell di tap oleh user
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //ambil index/row dari cell yang dipilih
    selectedIndex = indexPath.row;
    
    //panggil segue
    [self performSegueWithIdentifier:@"showDetailBantuan" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //index=selectedIndex;
        
    //ambil view controller tujuan
    DetailBantuanViewController *dbvc = segue.destinationViewController;
        
        //kirimkan vocabarray dan index yang terpilih
        dbvc.bantuanArray = bantuanArray;
        dbvc.bantuanIndex = selectedIndex;
}

@end
