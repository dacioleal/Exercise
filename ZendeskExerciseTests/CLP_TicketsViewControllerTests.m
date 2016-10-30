//
//  CLP_TicketsViewControllerTests.m
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 30/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CLP_TicketsViewController.h"
#import "CLP_StubTicketManager.h"
#import "CLP_TicketCell.h"
#import "CLP_Ticket.h"

@interface CLP_TicketsViewControllerTests : XCTestCase

@property (strong, nonatomic) CLP_TicketsViewController *sut;

@end

@implementation CLP_TicketsViewControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.sut = [[CLP_TicketsViewController alloc] init];
    self.sut.tableView.frame = CGRectMake(0, 0, 300, 300);
    CLP_StubTicketManager *stubTicketManager = [CLP_StubTicketManager manager];
    self.sut.ticketManager = stubTicketManager;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTicketsViewController_HasTableView {
    XCTAssertNotNil(self.sut.tableView);
}

- (void)testTicketsViewController_HasTicketManager {
    XCTAssertNotNil(self.sut.ticketManager);
}

- (void)testTicketsViewControllerFetchTickets_ShouldFillTicketManager {
    [self.sut.ticketManager fetchTicketsWithCompletionBlock:nil];
    XCTAssert(self.sut.ticketManager.numberOfTickets > 0);
}

- (void)testTableViewNumberOfRows_ShouldBeNumberOfTickets {
    [self.sut.ticketManager fetchTicketsWithCompletionBlock:nil];
    NSInteger numberOfRows = [self.sut.tableView numberOfRowsInSection:0];
    NSInteger numberOfTickets = self.sut.ticketManager.numberOfTickets;
    XCTAssertEqual(numberOfRows, numberOfTickets);
}

- (void)testTicketAtGivenRow_ShouldBeEqualToTicketAtGivenIndexInTicketManager {
    [self.sut.ticketManager removeAllTickets];
    CLP_Ticket *ticketOne = [[CLP_Ticket alloc] initWithIdentifier:1 AndTitle:@"Test title 1" AndDescription:@"Test description 1"];
    [self.sut.ticketManager addTicket:ticketOne];
    CLP_Ticket *ticketTwo = [[CLP_Ticket alloc] initWithIdentifier:2 AndTitle:@"Test title 2" AndDescription:@"Test description 2"];
    [self.sut.ticketManager  addTicket:ticketTwo];
    [self.sut.tableView reloadData];
    
    CLP_TicketCell *cellOne = [self.sut.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSString *titleOne = cellOne.textLabel.text;
    NSString *subtitleOne = cellOne.detailTextLabel.text;
    XCTAssertEqual(titleOne, ticketOne.title);
    XCTAssertEqual(subtitleOne, ticketOne.descriptionText);
    
    CLP_TicketCell *cellTwo = [self.sut.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    NSString *titleTwo = cellTwo.textLabel.text;
    NSString *subtitleTwo = cellTwo.detailTextLabel.text;
    XCTAssertEqual(titleTwo, ticketTwo.title);
    XCTAssertEqual(subtitleTwo, ticketTwo.descriptionText);
}



@end






