//
//  IAShopTableViewController.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/19.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "IAShopTableViewController.h"
#import "IAtopView.h"
#import "IAbottomView.h"
@interface IAShopTableViewController ()

@end

@implementation IAShopTableViewController
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    for(UIView*subview in self.view.window.subviews)
    {
        if ([subview isKindOfClass:[IAtopView class]]) {
            subview.hidden=YES;
        }
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    IAheaderView* IAheaderview=[IAheaderView IAheaderView];
    self.tableView.tableHeaderView=IAheaderview;
    IAheaderview.delegate=self;
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCell" forIndexPath:indexPath];
    cell.textLabel.text=@"wqe";
    // Configure the cell...
    
    return cell;
}
-(void)IAheaderViewdidback:(IAheaderView *)playBar
{
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
