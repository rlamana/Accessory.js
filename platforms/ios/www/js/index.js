/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
var app = {
    // Application Constructor
    initialize: function() {
        this.bindEvents();
    },
    
    // Bind Event Listeners
    //
    // Bind any events that are required on startup. Common events are:
    // 'load', 'deviceready', 'offline', and 'online'.
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicity call 'app.receivedEvent(...);'
    onDeviceReady: function() {
        var resultsElement = document.getElementById('results'),
            readButton = document.getElementById('read'),
            writeButton = document.getElementById('write');
        
        readButton.addEventListener('click', function() {
            cordova.exec(
                function callback(buffer) {
                    var result, str;
                         
                    if(!(buffer instanceof ArrayBuffer))
                         throw new TypeError();
                         
                    // Convert buffer to an array of bytes
                    result = new Uint8Array(buffer);
                    console.log('Read from accessory');
                         
                    // Convert to a string showing hexadecimal result
                    str = '0x';
                    for(var i=0,length=result.length; i<length; i++)
                         str += result[i].toString(16);
                         
                    resultsElement.innerHTML = 'Data read: ' + str;

                },
                function errorHandler(err) {
                    alert('Error');
                },
                'AccessoryBridge',
                'read', // Execute this method on the above class
                [] // Arguments
            );
        });
        
        writeButton.addEventListener('click', function() {
            cordova.exec(
                function callback(data) {
                         resultsElement.innerHTML = 'Data read: ' + data.data;
                         console.log('Read data');
                         console.log(data);
                },
                
                function errorHandler(err) {
                         alert('Error');
                 },
                         
                 'AccessoryBridge',
                 'write', // Execute this method on the above class
                 [] // Arguments
            );
        });
    }
};
