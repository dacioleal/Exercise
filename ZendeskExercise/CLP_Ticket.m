//
//  CLP_Ticket.m
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 26/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import "CLP_Ticket.h"

@interface CLP_Ticket ()

@property (nonatomic) NSInteger identifier;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *descriptionText;


@end

@implementation CLP_Ticket

- (instancetype) initWithIdentifier:(NSInteger)identifier AndTitle:(NSString *)title AndDescription:(NSString *)descriptionText {
    
    self = [super init];
    if (self) {
        _identifier = identifier;
        _title = title;
        _descriptionText = descriptionText;
    }
    return self;
}

- (NSInteger) identifier {
    return _identifier;
}

- (NSString *) title {
    return _title;
}

- (NSString *) descriptionText {
    return _descriptionText;
}



@end
