//
//  User.m
//  twitter
//
//  Created by aaronm17 on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.imageURL = dictionary[@"profile_banner_url"];
    }
    return self;
}
@end
