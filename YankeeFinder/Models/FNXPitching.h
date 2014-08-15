//
//  FNXPitching.h
//  
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FNXPitchingLevel;
@class FNXPitchingTeam;

@interface FNXPitching : NSObject 

@property (nonatomic, copy) NSNumber *aB;
@property (nonatomic, copy) NSNumber *b1;
@property (nonatomic, copy) NSNumber *b2;
@property (nonatomic, copy) NSNumber *b3;
@property (nonatomic, copy) NSNumber *cG;
@property (nonatomic, copy) NSNumber *eR;
@property (nonatomic, copy) NSNumber *g;
@property (nonatomic, copy) NSNumber *gF;
@property (nonatomic, copy) NSNumber *gS;
@property (nonatomic, copy) NSNumber *hBP;
@property (nonatomic, copy) NSNumber *hR;
@property (nonatomic, copy) NSNumber *iBB;
@property (nonatomic, copy) NSNumber *l;
@property (nonatomic, strong) FNXPitchingLevel *level;
@property (nonatomic, copy) NSNumber *levelID;
@property (nonatomic, copy) NSNumber *oUTS;
@property (nonatomic, copy) NSNumber *pA;
@property (nonatomic, copy) NSNumber *playerID;
@property (nonatomic, copy) NSNumber *r;
@property (nonatomic, copy) NSNumber *sF;
@property (nonatomic, copy) NSNumber *sH;
@property (nonatomic, copy) NSNumber *sHO;
@property (nonatomic, copy) NSNumber *sO;
@property (nonatomic, copy) NSNumber *sV;
@property (nonatomic, strong) FNXPitchingTeam *team;
@property (nonatomic, copy) NSNumber *teamID;
@property (nonatomic, copy) NSNumber *uBB;
@property (nonatomic, copy) NSNumber *w;
@property (nonatomic, copy) NSNumber *yearID;

+ (FNXPitching *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
