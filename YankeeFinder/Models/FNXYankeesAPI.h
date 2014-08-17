//
//  FNXAPI.h
//  YankeeFinder
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FNXYankeesAPI : NSObject

#pragma mark - Init Method
-(id)init;

#pragma mark - API Call Methods
-(void) getPlayerWithSearchString:(NSString *)searchString WithCallback:(FNXObjectCallback)callback;
-(void) getPlayerWithId:(NSString *)playerId WithCallback:(FNXObjectCallback)callback;
-(void) getPlayerStatsWithId:(NSString *)playerId WithCallback:(FNXObjectCallback)callback;
-(void) getPlayerPhoto:(NSString *)photoUrl WithCallback:(FNXObjectCallback)callback;
-(void) getTeamWithCallback:(FNXObjectCallback)callback;
-(void) getRosterWithTeamId:(NSString *)teamId WithCallback:(FNXObjectCallback)callback;

@end
