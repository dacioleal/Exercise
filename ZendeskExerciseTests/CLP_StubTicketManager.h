//
//  CLP_StubTicketManager.h
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 30/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import "CLP_TicketManager.h"

@interface CLP_StubTicketManager : CLP_TicketManager

+ (instancetype) manager;
- (void) fetchTicketsWithCompletionBlock:(void (^)(void))completionBlock;

@end
