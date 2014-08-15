//
//  FNXBattingLevel.h
//  
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FNXBattingLevel : NSObject 

@property (nonatomic, copy) NSString *abbr;
@property (nonatomic, copy) NSNumber *levelID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *sortOrder;

+ (FNXBattingLevel *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
