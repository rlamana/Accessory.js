//
//  AccessoryBridge.h
//  AccessoryBridge
//
//  Created by Ramón Lamana on 22/11/13.
//
//

#import <Cordova/CDVPlugin.h>

@interface AccessoryBridge : CDVPlugin

- (void) read:(CDVInvokedUrlCommand *)command;
- (void) write:(CDVInvokedUrlCommand *)command;
    
@end
