//
//  TableViewCell.h
//  entitys4thWeek
//
//  Created by Miguel Santiago Rodríguez on 23/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *showName;
@property (weak, nonatomic) IBOutlet UILabel *showSummary;
@end
