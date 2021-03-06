//
//  CLP_TicketsViewController.m
//  Zendesk Exercise
//
//  Created by Dacio Leal Rodriguez on 28/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//


#import "CLP_TicketsViewController.h"
#import "CLP_NetworkManager.h"
#import "CLP_TicketManager.h"
#import "CLP_TicketCell.h"
#import "CLP_Ticket.h"
#import "CLP_Constants.h"

@interface CLP_TicketsViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation CLP_TicketsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(_tableView);
        
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[_tableView]-0-|" options:0 metrics:nil views:views];
        constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_tableView]-0-|" options:0 metrics:nil views:views]];
        
        [self.view addConstraints:constraints];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self fetchTickets];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.ticketManager numberOfTickets];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TicketCell";
    CLP_TicketCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[CLP_TicketCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    CLP_Ticket *ticket = [self.ticketManager ticketAtIndex:indexPath.row];
    [cell configureCellWithTitle:ticket.title andDescription:ticket.descriptionText];
    return cell;
}



#pragma mark - TableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Fetch

- (void) fetchTickets {
    self.ticketManager = [CLP_TicketManager manager];
    [self.ticketManager fetchTicketsWithCompletionBlock:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}


@end
