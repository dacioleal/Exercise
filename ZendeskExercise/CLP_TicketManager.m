//
//  CLP_TicketManager.m
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 26/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import "CLP_TicketManager.h"
#import "CLP_NetworkManager.h"

@interface CLP_TicketManager ()

@property (strong, nonatomic) NSMutableArray *tickets;

@end

@implementation CLP_TicketManager

+ (instancetype) manager {
    
    static dispatch_once_t onceToken;
    static CLP_TicketManager *sharedInstance = nil;
    dispatch_once(&onceToken,^{
        
        sharedInstance = [[self alloc] init];
        sharedInstance.tickets = [[NSMutableArray alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Manage tickets

- (void) addTicket:(CLP_Ticket *)ticket {
    [self.tickets addObject:ticket];
}

- (CLP_Ticket *) ticketAtIndex:(NSUInteger)index {
    if (index < self.tickets.count) {
        CLP_Ticket *ticket = [self.tickets objectAtIndex:index];
        return ticket;
    }
    return nil;
}

- (NSInteger) numberOfTickets {
    return self.tickets.count;
}

#pragma mark - Fetch tickets

- (void) fetchTicketsWithCompletionBlock:(void (^)(void))completionBlock {
    [[CLP_NetworkManager sharedManager] fetchTicketsFromServerWithCompletionBlock:completionBlock];
}



@end
