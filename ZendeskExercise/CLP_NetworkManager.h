//
//  CLP_NetworkManager.h
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 25/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLP_NetworkManager : NSObject

- (void) fetchTicketsFromServerWithCompletionBlock:(void (^)(void)) completionBlock;

@end
