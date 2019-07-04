//
//  ComposeViewController.h
//  twitter
//
//  Created by aaronm17 on 7/3/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ComposeViewControllerDelegate

- (void)didTweet:(Tweet *)tweet;

@end

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *tweetMessage;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeTweet;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *composeTweet;
@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;



@end

NS_ASSUME_NONNULL_END
