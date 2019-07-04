//
//  TweetCell.m
//  twitter
//
//  Created by aaronm17 on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"

@interface TweetCell ()

@end


@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didTapFavorite:(id)sender {
    self.tweet.favorited = YES;
    self.tweet.favoriteCount += 1;
}

- (void)refreshData {
    if (self.tweet.favorited) {
        self.likes.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    }
    if (self.tweet.retweeted) {
        self.retweets.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    }
}
@end
