//
//  CLP_TicketCellTests.m
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 29/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CLP_TicketCell.h"
#import "CLP_Ticket.h"

@interface CLP_TicketCellTests : XCTestCase <UITableViewDataSource>

@property (strong, nonatomic) CLP_TicketCell *sut;
@property (strong, nonatomic) UITableView *fakeTableView;

@end

@implementation CLP_TicketCellTests

- (void)setUp {
    [super setUp];
    
    self.fakeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100.0, 100.0) style:UITableViewStylePlain];
    self.fakeTableView.dataSource = self;
    [self.fakeTableView registerClass:[CLP_TicketCell class] forCellReuseIdentifier:@"TicketCell"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConfigTicketCell_SetsTextLabelAndDetailTextLabel {
    
    self.sut = [self.fakeTableView dequeueReusableCellWithIdentifier:@"TicketCell" forIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    [self.sut configureCellWithTitle:@"Test title" andDescription:@"Test description"];
    NSLog(@"Detail: %@", self.sut.detailTextLabel.text);
    XCTAssertEqual(self.sut.textLabel.text, @"Test title");
    XCTAssertEqual(self.sut.detailTextLabel.text, @"Test description");
}




#pragma mark - Fake TableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"TicketCell" forIndexPath:indexPath];
}


@end
