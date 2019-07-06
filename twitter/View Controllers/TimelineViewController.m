//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "TweetCell.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"
#import "ComposeViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "DetailsViewController.h"

@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *displayedTweets;

//view controller has a tableview as a subview (step 1)
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //view controller becomes its dataSource and delegate in viewDidLoad (step 3)
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 150;
    [self beginRefreshing];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    
    [self.refreshControl addTarget:self action:@selector(beginRefreshing) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
}

//refreshes the timeline
- (void) beginRefreshing {
    
    //API manager calls the completion handler passing back data
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            
            //view controller stores that data passed into the completion handler (step 6)
            self.displayedTweets = [[NSMutableArray alloc] initWithArray:tweets];
            
            //reload the table view (step 7)
            //tableview asks its datasource for numberOfRows & cellForRowAt (step 8)
            [self.tableView reloadData];
        }
        else{
            NSLog(@"Error getting home timeline: %@", error.localizedDescription);
        }
    }];
    
    [self.refreshControl endRefreshing];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navigationController = [segue destinationViewController];
    if ([[segue destinationViewController] isKindOfClass:[ComposeViewController class]]) {
        ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
    }
/*    else if ([[segue destinationViewController] isKindOfClass: [DetailsViewController class]]) {
        TweetCell *tappedCell = sender;
    }*/
}

- (void)didTweet:(Tweet *)tweet {
    [self.displayedTweets insertObject:(tweet) atIndex:(0)];
    [self.tableView reloadData];
    
}

//initializes the current cell with all its info
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    //define a custom table view cell and set it's reuse identifier (step 2)
    TweetCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TweetCell"forIndexPath:indexPath];
    Tweet *tweet = self.displayedTweets[indexPath.row];
    
    cell.tweet = tweet;
    cell.authorName.text = tweet.user.name;
    cell.nameHandle.text = @"@";
    cell.nameHandle.text = [cell.nameHandle.text stringByAppendingString:tweet.user.screenName];
    cell.tweetText.text = tweet.text;
    cell.date.text = tweet.createdAtString;
    cell.likes.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
    cell.retweets.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];
    cell.replies.text = [NSString stringWithFormat:@"%d", tweet.replyCount];
    
    NSString *profilePic = tweet.user.imageURL;
    NSURL *picURL = [NSURL URLWithString:profilePic];
    
    cell.profileImage.image = nil;
    [cell.profileImage setImageWithURL:picURL];
    
    //cellForRow returns an instance of the custom cell with that reuse identifier with its elements populated with data at the index asked for (step 10)
    return cell;
}

//numberOfRows returns the number of items returned from that API (step 9)
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.displayedTweets.count;
}

//sets the logout button's functionality
- (IBAction)logout:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    
    [[APIManager shared] logout];
}

@end

