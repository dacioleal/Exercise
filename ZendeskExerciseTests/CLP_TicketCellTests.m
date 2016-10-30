//
//  CLP_TicketCellTests.m
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 29/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CLP_TicketCell.h"


@interface CLP_TicketCellTests : XCTestCase

@property (strong, nonatomic) CLP_TicketCell *sut;


@end

@implementation CLP_TicketCellTests

- (void)setUp {
    [super setUp];
    
    self.sut = [[CLP_TicketCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TicketCell"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConfigTicketCell_SetsTextLabelAndDetailTextLabel {
    [self.sut configureCellWithTitle:@"Test title" andDescription:@"Test description"];
    XCTAssertEqual(self.sut.textLabel.text, @"Test title");
    XCTAssertEqual(self.sut.detailTextLabel.text, @"Test description");
}

@end
