//
//  FNXPitchingTeam.h
//  
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FNXPitchingTeam : NSObject 

@property (nonatomic, copy) NSString *abbr;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *fullName;
@property (nonatomic, copy) NSNumber *leagueID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *teamID;

+ (FNXPitchingTeam *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
