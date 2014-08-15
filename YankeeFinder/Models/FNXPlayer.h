//
//  FNXPlayer.h
//  
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FNXPlayer : NSObject 

@property (nonatomic, copy) NSNumber *bats;
@property (nonatomic, copy) NSString *birthCity;
@property (nonatomic, copy) NSString *birthCountry;
@property (nonatomic, copy) NSString *birthDate;
@property (nonatomic, copy) NSString *birthState;
@property (nonatomic, copy) NSString *firstInitial;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *formalName;
@property (nonatomic, copy) NSString *fullName;
@property (nonatomic, copy) NSString *headShotURL;
@property (nonatomic, copy) NSNumber *height;
@property (nonatomic, assign) BOOL isPitcher;
@property (nonatomic, copy) NSString *lastInitial;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *middleName;
@property (nonatomic, copy) NSNumber *number;
@property (nonatomic, copy) NSNumber *playerID;
@property (nonatomic, copy) NSNumber *position;
@property (nonatomic, copy) NSNumber *teamID;
@property (nonatomic, copy) NSNumber *throws;
@property (nonatomic, copy) NSNumber *weight;

+ (FNXPlayer *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
