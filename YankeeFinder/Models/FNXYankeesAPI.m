//
//  FNXYankeesAPI.m
//  YankeeFinder
//
//  Created by Bill Weakley on 8/14/14.
//  Copyright (c) 2014 Fonixland Studios. All rights reserved.
//

#import "FNXYankeesAPI.h"
#import "FNXRequest.h"

@interface FNXYankeesAPI ()

#pragma mark - Request Method
-(void) createRequestWithType:(NSString *)requestType withUrl:(NSString *)url withParams:(NSDictionary *)params withCallback:(FNXObjectCallback)callback;

@end

@implementation FNXYankeesAPI

#pragma mark - Init Method
/**
 *  Initializer
 *
 *  @return an instance of FNXYankeesAPI
 */
-(id)init
{
    if ( self = [super init] )
    {
        return self;
    }
    else
    {
        return nil;
    }
}

/*
 GET api/player
 GET api/player/{id}
 GET api/player/{id}/stats
 GET api/Player?criteria={criteria}
 GET api/team
 GET api/team/{id}
 GET api/team/{id}/roster
 */

#pragma mark - API Call Methods
/**
 *  getPlayerWithSearchString:WithCallback:
 *
 *  @param callback containing an NSDictionary with the parsed JSON response, and an NSError if the API call fails
 */
-(void) getPlayerWithSearchString:(NSString *)searchString WithCallback:(FNXObjectCallback)callback {
    NSString *url = [NSString stringWithFormat:@"http://yankeesapplicant.azurewebsites.net/api/player?criteria=%@", searchString];
    
    FNXDebugLog(@"API - the url is - %@", url);
    
    [self createRequestWithType:@"GET" withUrl:url withParams:nil withCallback:^(NSDictionary *getPlayerResponse, NSError *error)
     {
         FNXDebugLog(@"API - response is - %@", getPlayerResponse);
         callback(getPlayerResponse, error);
     }];
}

/**
 *  getPlayerWithId:WithCallback:
 *
 *  @param callback containing an NSDictionary with the parsed JSON response, and an NSError if the API call fails
 */
-(void) getPlayerWithId:(NSString *)playerId WithCallback:(FNXObjectCallback)callback {
    NSString *url = [NSString stringWithFormat:@"http://yankeesapplicant.azurewebsites.net/api/player/%@", playerId];
    
    FNXDebugLog(@"API - the url is - %@", url);
    
    [self createRequestWithType:@"GET" withUrl:url withParams:nil withCallback:^(NSDictionary *getPlayerResponse, NSError *error)
     {
         FNXDebugLog(@"API - response is - %@", getPlayerResponse);
         callback(getPlayerResponse, error);
     }];
}

/**
 *  getPlayerWithId:WithCallback:
 *
 *  @param callback containing an NSDictionary with the parsed JSON response, and an NSError if the API call fails
 */
-(void) getPlayerStatsWithId:(NSString *)playerId WithCallback:(FNXObjectCallback)callback {
    NSString *url = [NSString stringWithFormat:@"http://yankeesapplicant.azurewebsites.net/api/player/%@/stats", playerId];
    
    FNXDebugLog(@"API - the url is - %@", url);
    
    [self createRequestWithType:@"GET" withUrl:url withParams:nil withCallback:^(NSDictionary *getPlayerResponse, NSError *error)
     {
         FNXDebugLog(@"API - response is - %@", getPlayerResponse);
         callback(getPlayerResponse, error);
     }];
}

/**
 *  getPlayerPhoto:WithCallback:
 *
 *  @param callback containing an NSDictionary with the parsed JSON response, and an NSError if the API call fails
 */
-(void) getPlayerPhoto:(NSString *)photoUrl WithCallback:(FNXObjectCallback)callback {
    NSString *url = photoUrl;
    
    FNXDebugLog(@"API - the url is - %@", url);
    
    [self createMediaRequestWithType:@"GET" withUrl:url withParams:nil withCallback:^(NSData *getPlayerPhotoResponse, NSError *error)
     {
                  FNXDebugLog(@"API - response is - %@", getPlayerPhotoResponse);
         callback(getPlayerPhotoResponse, error);
     }];
}

/**
 *  getTeamWithCallback:
 *
 *  @param callback containing an NSDictionary with the parsed JSON response, and an NSError if the API call fails
 */
-(void) getTeamWithCallback:(FNXObjectCallback)callback {
    NSString *url = [NSString stringWithFormat:@"http://yankeesapplicant.azurewebsites.net/api/team"];
    
    FNXDebugLog(@"API - the url is - %@", url);
    
    [self createRequestWithType:@"GET" withUrl:url withParams:nil withCallback:^(NSDictionary *getTeamResponse, NSError *error)
     {
         FNXDebugLog(@"API - response is - %@", getTeamResponse);
         callback(getTeamResponse, error);
     }];
}

/**
 *  getRosterWithTeamId:
 *
 *  @param callback containing an NSDictionary with the parsed JSON response, and an NSError if the API call fails
 */
-(void) getRosterWithTeamId:(NSString *)teamId WithCallback:(FNXObjectCallback)callback {
    NSString *url = [NSString stringWithFormat:@"http://yankeesapplicant.azurewebsites.net/api/team/%@/roster", teamId];
    
    FNXDebugLog(@"API - the url is - %@", url);
    
    [self createRequestWithType:@"GET" withUrl:url withParams:nil withCallback:^(NSDictionary *getRosterResponse, NSError *error)
     {
         FNXDebugLog(@"API - response is - %@", getRosterResponse);
         callback(getRosterResponse, error);
     }];
}


#pragma mark - Private Methods
// @name Private Methods
//
// PRIVATE method used by FNXRequestController to handle Web Services requests,
// and should never be called directly.
//
// @param requestType POST or GET
// @param url         URL in NSString format
// @param params      an NSDictionary of all parameters
// @param callback    callback containing an NSDictionary and NSError, possible results of the API call
-(void) createRequestWithType:(NSString *)requestType withUrl:(NSString *)url withParams:(NSDictionary *)params withCallback:(FNXObjectCallback)callback
{
    FNXDebugLog(@"------------------ createRequestWithType ------------------");
    
    FNXDebugLog(@"API - URL: %@", url);
    
    // Set up the request objects
    NSURL *requestUrl = [NSURL URLWithString:url];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL: requestUrl];
    
    // set the request method
    if ([requestType isEqualToString:@"POST"])
        [theRequest setHTTPMethod: @"POST"];
    
    if ([requestType isEqualToString:@"GET"])
        [theRequest setHTTPMethod: @"GET"];
    
    
    // set parameters if they have been passed
    NSError *error = nil;
    
    if (params != nil)
    {
        NSData *myRequestData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
        FNXDebugLog(@"API - JSON Sent: %@", [[NSString alloc] initWithData:myRequestData encoding:NSUTF8StringEncoding]);
        //FNXDebugLog(@"API - params are %@", params);
        //FNXDebugLog(@"API - The convert_from dict error is %@", error);
        
        [theRequest setHTTPBody: myRequestData ];
    }
    
    // set http header
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    
    // send the request
    //NSData *theResponse = [FNXRequest sendRequest:(NSMutableURLRequest *)theRequest];
    
    __block NSDictionary *returnDict;
    __block NSError *returnError;
    
    FNXRequest *myRequest = [[FNXRequest alloc] init];
    [myRequest sendAsyncRequest:(NSMutableURLRequest *)theRequest withCallback:^(id object, NSError *error)
     {
         // convert the json to dictionary and return it
         if (error != nil)
         {
             returnDict = nil;
             returnError = error;
         }
         else
         {
             NSError *jsonError = nil;
             
             returnDict = [NSJSONSerialization JSONObjectWithData: object options: NSJSONReadingMutableContainers error: &jsonError];
             
             if (!returnDict)
             {
                 returnDict = nil;
                 returnError = jsonError;
             }
             else
             {
                 returnError = nil;
             }
         }
         
         
         callback(returnDict, returnError);
     }];
    
    FNXDebugLog(@"----------------- END  createRequestWithType ------------------");
}

-(void) createMediaRequestWithType:(NSString *)requestType withUrl:(NSString *)url withParams:(NSDictionary *)params withCallback:(FNXObjectCallback)callback
{
    FNXDebugLog(@"------------------ createMediaRequestWithType ------------------");
    
    FNXDebugLog(@"API - URL: %@", url);
    
    // Set up the request objects
    NSURL *requestUrl = [NSURL URLWithString:url];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL: requestUrl];
    
    // set the request method
    if ([requestType isEqualToString:@"POST"])
        [theRequest setHTTPMethod: @"POST"];
    
    if ([requestType isEqualToString:@"GET"])
        [theRequest setHTTPMethod: @"GET"];
    
    // set parameters if they have been passed
    NSError *error = nil;
    
    if (params != nil)
    {
        NSData *myRequestData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
        
        [theRequest setHTTPBody: myRequestData];
    }
    
    // set http header
    [theRequest setValue:@"text/html" forHTTPHeaderField:@"content-type"];
    
    __block NSData *returnData;
    __block NSError *returnError;
    
    FNXRequest *myRequest = [[FNXRequest alloc] init];
    [myRequest sendAsyncRequest:(NSMutableURLRequest *)theRequest withCallback:^(id object, NSError *error) {
        
        // return it
        if (error != nil)
        {
            returnData = nil;
            returnError = error;
        }
        else
        {
            NSError *dataError = nil;
            if (!object)
            {
                returnData = nil;
                returnError = dataError;
            }
            else
            {
                returnData = object;
                returnError = nil;
            }
        }
        
        callback(returnData, returnError);
    }];
    
    FNXDebugLog(@"----------------- END  createMediaRequestWithType ------------------");
}

@end
