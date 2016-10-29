//
//  CLP_TicketManager.h
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 26/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLP_Ticket;

@interface CLP_TicketManager : NSObject

+ (instancetype) manager;

- (void) addTicket:(CLP_Ticket *)ticket;
- (CLP_Ticket *) ticketAtIndex:(NSUInteger)index;
- (NSInteger) numberOfTickets;
- (void) removeAllTickets;

- (void) fetchTicketsWithCompletionBlock:(void (^)(void))completionBlock;

@end
