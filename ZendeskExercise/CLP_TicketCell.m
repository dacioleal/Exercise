//
//  CLP_TicketCell.m
//  ZendeskExercise
//
//  Created by Dacio Leal Rodriguez on 28/10/16.
//  Copyright © 2016 Christopher La Pat. All rights reserved.
//

#import "CLP_TicketCell.h"

@interface CLP_TicketCell ()

@end

@implementation CLP_TicketCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
    }
    return self;
}

- (void) configureCellWithTitle:(NSString *)title andDescription:(NSString *)descriptionText {
    
    self.textLabel.text = title;
    self.detailTextLabel.text = descriptionText;
}

@end
