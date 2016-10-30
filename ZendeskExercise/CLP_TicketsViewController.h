//
//  CLP_MainViewController.h
//  Zendesk Exercise
//

#import <UIKit/UIKit.h>

@class CLP_TicketManager;

@interface CLP_TicketsViewController : UIViewController

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) CLP_TicketManager *ticketManager;

- (void) fetchTickets;

@end
