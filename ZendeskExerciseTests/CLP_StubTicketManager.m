//
//  CLP_StubTicketManager.m
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 30/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import "CLP_StubTicketManager.h"
#import "CLP_Ticket.h"

@interface CLP_StubTicketManager ()

@property (strong, nonatomic) NSMutableArray *tickets;

@end

@implementation CLP_StubTicketManager

+ (instancetype) manager {
    
    static dispatch_once_t onceToken;
    static CLP_StubTicketManager *sharedInstance = nil;
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

- (void) removeAllTickets {
    [self.tickets removeAllObjects];
}

#pragma mark - Fetch tickets

- (void) fetchTicketsWithCompletionBlock:(void (^)(void))completionBlock {
    [self removeAllTickets];
    CLP_Ticket *ticketOne = [[CLP_Ticket alloc] initWithIdentifier:1 AndTitle:@"Test title 1" AndDescription:@"Test description 1"];
    [self addTicket:ticketOne];
    CLP_Ticket *ticketTwo = [[CLP_Ticket alloc] initWithIdentifier:2 AndTitle:@"Test title 2" AndDescription:@"Test description 2"];
    [self addTicket:ticketTwo];
}


@end
