//
//  Cometa.h
//  Cometa
//
//  Created by Ramón Lamana on 22/11/13.
//
//

#import <Cordova/CDVPlugin.h>

@interface Cometa : CDVPlugin

- (void) read:(CDVInvokedUrlCommand *)command;
- (void) write:(CDVInvokedUrlCommand *)command;

@end
