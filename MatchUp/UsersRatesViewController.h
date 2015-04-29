//
//  UsersRatesViewController.h
//  MatchUp
//
//  Created by JETS on 4/5/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsersRatesViewController : UITableViewController < NSURLConnectionDataDelegate , NSURLConnectionDelegate , UIAlertViewDelegate  >

{
    NSURLConnection* connection;
    NSArray* imagesNames ;
}
@property NSMutableString* asyncResponse ;


@end
