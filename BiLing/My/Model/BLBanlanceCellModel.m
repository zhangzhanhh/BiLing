//
//  BLBanlanceCellModel.m
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLBanlanceCellModel.h"

@implementation BLBanlanceCellModel
- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title{
    self = [super init];
    if (self) {
        self.imageName = imageName;
        self.title = title;
    }
    return self;
}
@end
