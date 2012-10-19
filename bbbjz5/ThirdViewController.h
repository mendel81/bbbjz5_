//
//  ThirdViewController.h
//  bbbjz5
//
//  Created by Synapse Asesores Informaticos, S.L. on 15/10/12.
//  Copyright (c) 2012 Synapse Asesores Informaticos, S.L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UITableViewController{
    NSMutableArray *tweets;
}

- (void)fetchTweets;

@end
 