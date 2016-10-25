//
//  CLP_NetworkManager.m
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 25/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import "CLP_NetworkManager.h"
#import "CLP_FetchTicketsOperation.h"

@interface CLP_NetworkManager ()

@property (strong, nonatomic) NSOperationQueue *operationQueue;

@end

@implementation CLP_NetworkManager

+(instancetype) sharedManager {
    
    static dispatch_once_t onceToken;
    static CLP_NetworkManager *sharedInstance = nil;
    dispatch_once(&onceToken,^{
        
        sharedInstance = [[self alloc] init];
        sharedInstance.operationQueue = [[NSOperationQueue alloc] init];
        sharedInstance.operationQueue.maxConcurrentOperationCount = 3;
    });
    return sharedInstance;
}

- (void) fetchTicketsFromServerWithCompletionBlock:(void (^)(void)) completionBlock {
    
    CLP_FetchTicketsOperation *fetchTicketsOperation = [[CLP_FetchTicketsOperation alloc] init];
    fetchTicketsOperation.name = @"FetchTicketsOperation";
    fetchTicketsOperation.completionBlock = completionBlock;
    [self.operationQueue addOperation:fetchTicketsOperation];
}

@end
