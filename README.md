# Twitter

**Name of your app** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **18** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User sees app icon in home screen and styled launch screen
- [X] User can sign in using OAuth login flow
- [X] User can Logout
- [X] User can view last 20 tweets from their home timeline
- [X] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [X] User can pull to refresh.
- [X] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [X] User can compose a new tweet by tapping on a compose button.
- [X] Using AutoLayout, the Tweet cell should adjust it's layout for iPhone 7, Plus and SE device sizes as well as accommodate device rotation.

The following **optional** features are implemented:

- [ ] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet, favorite, and reply.
- [ ] User can view their profile in a *profile tab*
- Contains the user header view: picture and tagline
- Contains a section with the users basic stats: # tweets, # following, # followers
- [ ] Profile view should include that user's timeline
- [X] User should display the relative timestamp for each tweet "8m", "7h"
- [X] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. Refer to [[this guide|unretweeting]] for help on implementing unretweeting.
- [ ] Links in tweets are clickable.
- [ ] User can tap the profile image in any tweet to see another user's profile
- Contains the user header view: picture and tagline
- Contains a section with the users basic stats: # tweets, # following, # followers
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [ ] When composing, you should have a countdown for the number of characters remaining for the tweet (out of 140) (**1 point**)
- [ ] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet (**2 points**)
- [ ] User sees embedded images in tweet if available
- [ ] User can switch between timeline, mentions, or profile view through a tab bar (**3 points**)
- [ ] Profile Page: pulling down the profile page should blur and resize the header image. (**4 points**)


The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. I would've liked to have more time to figure out how to do the details view controller. I assume it isn't really that difficult, as it's most likely very similar to what we did in flix with the details movie page, but I just ran out of time.
2. I also would've liked to figure out how to make a profile page, which I think I could've done with more time. In general, I had a lot of time wasted on dumb xCode errors that I required help to fix because I didn't know they existed, which limited my time and didn't allow me to get as many of the bonus features done as I wanted to try.

## Video Walkthrough

Here's a walkthrough of implemented user stories (part 1);

<img src='http://g.recordit.co/07yoYV8mEG.gif' width='' alt='Video Walkthrough' />

Part 2:

<img src='http://g.recordit.co/ABRI9ZSyJ3.gif' width='' alt='Video Walkthrough' />

## Notes

In general, I had a lot of time wasted on dumb xCode errors that I required help to fix because I didn't know they existed, which limited my time and didn't allow me to get as many of the bonus features done as I wanted to try. I feel like there are many I wanted to try to implement, namely the profile page and tweet details page to make my app feel as close to twitter as possible, but unfortunately I wasn't able to.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

Copyright [yyyy] [name of copyright owner]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
