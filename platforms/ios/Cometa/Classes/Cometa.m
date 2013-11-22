//
//  Cometa.m
//  Cometa
//
//  Created by Ramón Lamana on 22/11/13.
//
//

#import "Cometa.h"

@implementation Cometa

- (void) read:(CDVInvokedUrlCommand*)command {
    NSDictionary* jsonObj = [ [NSDictionary alloc]
                             initWithObjectsAndKeys :
                             @"This is data from read call in Obj-C!.", @"data",
                             @"true", @"success",
                             nil
                             ];
    
    CDVPluginResult* pluginResult = [ CDVPluginResult
                                     resultWithStatus    : CDVCommandStatus_OK
                                     messageAsDictionary : jsonObj
                                     ];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) write:(CDVInvokedUrlCommand*)command {
    NSDictionary* jsonObj = [ [NSDictionary alloc]
                             initWithObjectsAndKeys :
                             @"This is data from write call in Obj-C!.", @"data",
                             @"true", @"success",
                             nil
                             ];
    
    CDVPluginResult* pluginResult = [ CDVPluginResult
                                     resultWithStatus    : CDVCommandStatus_OK
                                     messageAsDictionary : jsonObj
                                     ];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
