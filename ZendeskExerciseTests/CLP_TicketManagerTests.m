//
//  CLP_TicketManagerTests.m
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 29/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CLP_TicketManager.h"
#import "CLP_Ticket.h"

@interface CLP_TicketManagerTests : XCTestCase

@property (nonatomic, strong) CLP_TicketManager *sut;

@end

@implementation CLP_TicketManagerTests

- (void)setUp {
    [super setUp];

    self.sut = [CLP_TicketManager manager];
    [self.sut removeAllTickets];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTicketManager_managerInstanceNotNil {
    XCTAssertNotNil(self.sut);
}

- (void)testTicketManager_isAlwaysTheSameInstance {
    CLP_TicketManager *manager1 = [CLP_TicketManager manager];
    CLP_TicketManager *manager2 = [CLP_TicketManager manager];
    XCTAssertEqual(manager1, manager2);
}

- (void)testAddOneTicket_ResultsInTicketsCountIncrementsOne {
    CLP_Ticket *ticketOne = [[CLP_Ticket alloc] initWithIdentifier:1 AndTitle:@"Test title 1" AndDescription:@"Test description 1"];
    [self.sut addTicket:ticketOne];
    XCTAssertEqual(self.sut.numberOfTickets, 1);
    
    CLP_Ticket *ticketTwo = [[CLP_Ticket alloc] initWithIdentifier:1 AndTitle:@"Test title 2" AndDescription:@"Test description 2"];
    [self.sut addTicket:ticketTwo];
    XCTAssertEqual(self.sut.numberOfTickets, 2);
}

- (void)testTicketAtIndex_ShouldReturnPreviouslyAddedTicket {
    CLP_Ticket *ticketOne = [[CLP_Ticket alloc] initWithIdentifier:1 AndTitle:@"Test title 1" AndDescription:@"Test description 1"];
    [self.sut addTicket:ticketOne];
    CLP_Ticket *ticketAtIndexZero = [self.sut ticketAtIndex:0];
    XCTAssertEqual(ticketOne, ticketAtIndexZero);
    
    CLP_Ticket *ticketTwo = [[CLP_Ticket alloc] initWithIdentifier:1 AndTitle:@"Test title 2" AndDescription:@"Test description 2"];
    [self.sut addTicket:ticketTwo];
     CLP_Ticket *ticketAtIndexOne = [self.sut ticketAtIndex:1];
    XCTAssertEqual(ticketAtIndexOne, ticketTwo);
}

- (void)testRemoveAllTickets_ResultsInTicketsCountZero {
    CLP_Ticket *ticketOne = [[CLP_Ticket alloc] initWithIdentifier:1 AndTitle:@"Test title 1" AndDescription:@"Test description 1"];
    [self.sut addTicket:ticketOne];
    CLP_Ticket *ticketTwo = [[CLP_Ticket alloc] initWithIdentifier:1 AndTitle:@"Test title 2" AndDescription:@"Test description 2"];
    [self.sut addTicket:ticketTwo];
    [self.sut removeAllTickets];
    XCTAssertEqual(self.sut.numberOfTickets, 0);
}


@end
