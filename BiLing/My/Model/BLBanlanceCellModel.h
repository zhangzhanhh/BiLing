//
//  BLBanlanceCellModel.h
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLBanlanceCellModel : NSObject

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title;

@property (copy, nonatomic) NSString *imageName;
@property (copy, nonatomic) NSString *title;
@end
