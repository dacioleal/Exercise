//
//  CLP_TicketTests.m
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 29/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CLP_Ticket.h"

@interface CLP_TicketTests : XCTestCase

@property (strong, nonatomic) CLP_Ticket *sut;
@end

@implementation CLP_TicketTests

- (void)setUp {
    [super setUp];

    self.sut = [[CLP_Ticket alloc] initWithIdentifier:1 AndTitle:@"Test title" AndDescription:@"Test description"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTicket_HasIdentifier {
    XCTAssertNotEqual(_sut.identifier, 0);
}

- (void)testTicket_HasTitle {
    XCTAssertNotNil(_sut.title);
}

- (void)testTicket_HasDescription {
    XCTAssertNotNil(_sut.descriptionText);
}

- (void)testTicketIdentifier_IsGivenIdentifier {
    XCTAssertEqual(_sut.identifier, 1);
}

- (void)testTicketTitle_IsGivenTitle {
    XCTAssertEqual(_sut.title, @"Test title");
}

- (void)testTicketDescription_IsGivenDescription {
    XCTAssertEqual(_sut.descriptionText, @"Test description");
}


@end
