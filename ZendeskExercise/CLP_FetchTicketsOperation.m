//
//  CLP_FetchTicketsOperation.m
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 25/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import "CLP_FetchTicketsOperation.h"
#import "CLP_Constants.h"
#import "CLP_TicketManager.h"
#import "CLP_Ticket.h"

@implementation CLP_FetchTicketsOperation

- (void) main {

    NSURL *url = [NSURL URLWithString:SERVER_URL_FOR_TICKETS];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    NSString *userName = USER_NAME;
    NSString *password = USER_PASSWORD;
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", userName, password];
    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authValue =[NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSHTTPURLResponse *resp = (NSHTTPURLResponse *) response;
        
        if (resp.statusCode == 200 && !error) {
            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            responseDict ? [self parseTicketsFromDictionary:responseDict] : nil;
        }
        
        error ? NSLog(@"Error: %@", error.description) : nil;
        dispatch_semaphore_signal(semaphore);
    }];

    [sessionDataTask resume];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}


- (void) parseTicketsFromDictionary:(NSDictionary *) dict {
    
    CLP_TicketManager *ticketManager = [CLP_TicketManager manager];
    NSArray *tickets = [dict valueForKey:@"tickets"];
    
    for (NSDictionary *ticketDict in tickets) {
        
        NSInteger identifierValue = [[ticketDict valueForKey:@"id"] integerValue];
        NSString *titleValue = [ticketDict valueForKey:@"subject"];
        NSString *descriptionValue = [ticketDict valueForKey:@"description"];
        NSString *statusValue = [ticketDict valueForKey:@"status"];
        NSString *title = [NSString stringWithFormat:@"%ld\t%@", (long)identifierValue, titleValue];
        NSString *descriptionText = [NSString stringWithFormat:@"%@\t%@", descriptionValue, statusValue];
        
        CLP_Ticket *ticket = [[CLP_Ticket alloc] initWithIdentifier:identifierValue AndTitle:title AndDescription:descriptionText];
        [ticketManager addTicket:ticket];
    }
    NSLog(@"Fetched tickets");
}

@end
