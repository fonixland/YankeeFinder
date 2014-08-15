//
//  FNXBatting.h
//  
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FNXBattingLevel;
@class FNXBattingTeam;

@interface FNXBatting : NSObject

@property (nonatomic, copy) NSNumber *aB;
@property (nonatomic, copy) NSNumber *b1;
@property (nonatomic, copy) NSNumber *b2;
@property (nonatomic, copy) NSNumber *b3;
@property (nonatomic, copy) NSNumber *cI;
@property (nonatomic, copy) NSNumber *cS;
@property (nonatomic, copy) NSNumber *g;
@property (nonatomic, copy) NSNumber *hBP;
@property (nonatomic, copy) NSNumber *hR;
@property (nonatomic, copy) NSNumber *iBB;
@property (nonatomic, strong) FNXBattingLevel *level;
@property (nonatomic, copy) NSNumber *levelID;
@property (nonatomic, copy) NSNumber *pA;
@property (nonatomic, copy) NSNumber *playerID;
@property (nonatomic, copy) NSNumber *r;
@property (nonatomic, copy) NSNumber *rBI;
@property (nonatomic, copy) NSNumber *sB;
@property (nonatomic, copy) NSNumber *sF;
@property (nonatomic, copy) NSNumber *sH;
@property (nonatomic, copy) NSNumber *sO;
@property (nonatomic, strong) FNXBattingTeam *team;
@property (nonatomic, copy) NSNumber *teamID;
@property (nonatomic, copy) NSNumber *uBB;
@property (nonatomic, copy) NSNumber *yearID;

+ (FNXBatting *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
