//
//  CLP_Ticket.h
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 26/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLP_Ticket : NSObject

- (instancetype) initWithIdentifier:(NSInteger)identifier AndTitle:(NSString *)title AndDescription:(NSString *)descriptionText;

- (NSString *) title;
- (NSString *) descriptionText;
- (NSInteger) identifier;

@end
