---
categories : ["NodeJS", "Programming"]
tags : ["tutorial", "backend", "server", "datatypes"]
date : "2018-06-13"
description : "How to use npm and express.js to build a Node.js based HTTP server"
image : "img/2018/06/node-js-logo.png"
title : "Node.js for beginners: Part 3"
type : "post"
draft : true
weight : 1
showonlyimage : false
---

# Our first HTTP server by hand 

{{< highlight js >}}
    var terminal = require('./terminal.js');
    var my_array = [];
    var question = 'What string to you want to add to the array?';
    var callback = function (str) { //str is our line
        if (str === 'exit') {
            process.exit(); //ends the programm when called
        } else {
            if (str === 'list') {
                for (var element of my_array) {
                    console.log(element);
                }
            } else {
                my_array.push(str);
            }
        }
    };
    terminal.prompt(question, callback);

{{< /highlight >}}
{{< highlight js >}}
{{< /highlight >}}


# Existing frameworks and libraries 




## Express.js


WIP: Client

## Modules

## Installing modules with npm



# A simple HTTP reverse echo server


# Conclusion


# Your homework

* Try writing a HTTP endpoint that takes a string and returns the characters in reverse order
* Write a ping pong application: two endpoints that log 'ping' or 'pong' to the console, and immediately query the other endpoint. How would you start this chain? Warning: this program will lead to an infinite loop, so use the SIGTERM command, which will end the current process within a few seconds (in Windows that is pressing 'CTRL+C' while inside the terminal).
