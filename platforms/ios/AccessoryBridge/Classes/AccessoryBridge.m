//
//  AccessoryBridge.m
//  AccessoryBridge
//
//  Created by Ramón Lamana on 22/11/13.
//
//

#import "AccessoryBridge.h"

@implementation AccessoryBridge

- (void) read:(CDVInvokedUrlCommand*)command {
    NSMutableData* data = [[NSMutableData alloc] init];
    uint16_t value = (uint16_t) 0x4000;
    
    [data appendBytes:(void*)&value length:2];

    
    CDVPluginResult* pluginResult = [CDVPluginResult
                                     resultWithStatus: CDVCommandStatus_OK
                                     messageAsArrayBuffer: data
                                     ];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
    
- (void) write:(CDVInvokedUrlCommand*)command {
    NSDictionary* jsonObj = [ [NSDictionary alloc]
                             initWithObjectsAndKeys :
                             @"Data from the Obj-C write call!.", @"data",
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
