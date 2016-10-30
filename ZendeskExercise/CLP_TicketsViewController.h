//
//  CLP_TicketsViewController.h
//  Zendesk Exercise
//
//  Created by Dacio Leal Rodriguez on 28/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CLP_TicketManager;

@interface CLP_TicketsViewController : UIViewController

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) CLP_TicketManager *ticketManager;

- (void) fetchTickets;

@end
