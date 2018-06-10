---
categories : ["NodeJS", "Programming"]
tags : ["tutorial", "backend", "server", "datatypes"]
date : "2018-06-10"
description : "Learn how to deal with console input, data types, and multiple files in Node.js"
title : "Node.js for beginners: Part 2"
type : "post"
draft : false
weight : 1
showonlyimage : false
---

# Types of data in JavaScript

In our previous post we discovered two basic types a variable can have:

* `number`, a number, more specifically a floating point number (with 64 bits), allowing us to use `+`, `/`, and other numeric operands.
* `string`, a sequence of characters that combine to a text, which we can also concatenate using `+`.

There are a few more we need to talk about before continuing.

## Basic Types

Besides `number` and `string` we have on more type:

 `boolean`, which means either `true` or `false`. This is the result of a logical operation: something is `true` or it isn't. Most often these kind of values appear within a conditional statement like `if ... else ...`. We will see them often times in actual code, but for now you know enough about `boolean`.



    var a = true; //is true
    var b = false; //is not true
    var c = a & b; // & means 'AND' => is not true
    var d = a | b; // | means 'OR' => is true


    var e = (a & b) && b; //&& is an early return operand: if the left operand is false, the result has to be false, and we will not evaluate the right operand (it cannot change the result). In this case it does the same as a single &, but it's good to talk about it, because && appears often in actual code 


## Arrays

An `array` is a completely different type: You may explain it to yourself as a list. While

    var x = 2;

makes `x` a number,

    var y = [1, 2, 3];

makes `y` an array, or more specifically: an array of numbers. Therefore an array is a collection of multiple values. Of course, these kind of collections can be modified afterwards, and also queried by an index (always starting with 0):

    y.push(42); //y = [1, 2, 3, 42];
    console.log( y[3] ); //prints out the fourth element: 42

To be complete, it is also possible to have empty arrays:

    var q = []; //has no element in it

And it's also possible to remove existing elements by their index:

    var p = [4,5,6];
    p.splice(1, 1); // q = [4,6];
    p.splice(0, 1); // q = [6];


While we will be seeing more on control flow loops later in this post, a simple loop is the so called `for-each-loop`:

    for ( var element of y ) {
        console.log(element);
    }

This block of code will iterate over each element in the array `y`, and print each of those elements out on the console, in a separate line. While it's also possible to write 4 separate `console.log(y[...]);` with each index, it unnecessarily repeats the same code. Our new loop also allows us to deal with arrays we don't know the size of yet. It will still print out every single element, leaving none out. 


## Objects / Maps

You probably heard about object oriented programming, or OOP before. We will now be talking about those objects.

In JavaScript, an object consists of multiple fields of whatever type. Each of those fields has a name. To be precise, each field maps from this given name to the contained value. You can set an object's field by the so called dot-syntax: `<object>.<field> = <value>;`. For an example:

    var my_object = {}; //an object without fields
    my_object.first_field = 'world';
    my_object.second_field = 42;
    console.log(my_object.first_field); //prints out 'world'
    console.log(my_object.second_field); //prints out 42
    var other_obj = {a : 13, b: true, c: 'hello world' }; //defines a new object with three fields in the same line

Because of this mapping from name to value, JavaScript object are also called `maps`. The dot-syntax is not the only way to access fields:

    console.log(my_object["first_field"]); //prints out 
    'hello'
    my_object["first_field"] = 13; 
    console.log(my_object.first_field); //prints out 13 this time



## null and undefined

There are two special values and types:

* `undefined` is the value of a variable that has not been given any value. In other terms, it's the lack of a value. If you forget to set a variable's value, it will contain `undefined`. 
* `null` is a value of type object, but without being an object. You can use it to describe a missing value of type object. JavaScript itself never sets `null`. It's up to you or other programmers to use it, and to decide on what to use it for. Some programmers try to not use `null` at all, and some programming languages have gotten rid of it altogether.


    var x;
    console.log(x); //will be printing out 'undefined', but it's not a string!
    x = null;
    console.log(x); //prints out 'null', which is also not a string
    x["my_field"] = 42; // throws an error, because 'null' is not an object and therefore cannot have fields

So much on the different types of JavaScript. Thanks to arrays and objects / maps we can represent any type of data within a tree of multiple objects and multiple arrays. Not to sound cheesy, but our minds are the only limit.
Let's get back to actual coding. It's recommended to create a new folder with a new empty `app.js` for each blog post if you want to keep your previous content. You may also keep the same folder, and rename the previous file to `app_1.js` or something, so that `app.js` is the name of the current program.

# Making our program read in arguments


So far our programs have only been printing out values, and containing basic arithmetic expressions or concatenation of strings. It's time to make it depend on what we put into it! Enter program arguments.


    var args = process.argv; //process is a global object given by node.js, and argv is a field containing the whitespace delimited arguments of the program call
    for (var arg of args) {
        console.log(arg); //print out each argument
    }

Let's execute this program on the command line and see the output:
    
    $ node app.js hello world 42
    node
    app.js
    hello
    world
    42

We see that it parses the whole command, even though `node app.js` are not arguments to our program, but `node` and our program as an argument to `node` itself. Therefore we have to start our arguments at index `2`. It's also possible to instead use:

    var args = process.argv.slice(2); //will only contain our arguments

Let's take those arguments and implement a simple logic: if there are no arguments, print out 'hello world'. If there is an argument, like a name, print out 'hello ' followed by the argument, except when it's Bob, because hate bob. We will instead tell him to 'go home bob, you're not welcome here.

During this task, we will be introducing the `if` conditional statement, and also comparison between strings. Let's start with comparison:

    var a = 32; //a = 32
    var b = a === 32; //b = true
    var c = b !== true; //c = false
    var d = 'hello '; // d = 'hello '
    var e = (d + 'world') === 'hello world'; // true
    var f = (d + 'world') === 'hello bob'; // false
    var g = !f; // g = !false = true 

Simple enough. You may be confused why the comparison is 3 `=`. Let's go through this: 1 `=` is the assignment operator, which we have been using all along to assign values to variables. 2 `=` meanwhile is the value based comparison. 3 `=` is the type-contextual comparison, and most often what we want. Let's explain the difference on actual code:

    var x = '42';
    var y = 42;
    var a = x == y; //true
    var b = x === y; //false

You may remember the automatic type conversion we have been talking about in part 1. The normal comparison operator only cares for values, so it automatically converts between types, which makes the comparison true in this case. But x is a string, and y is a number, so we do not want to see them as equal (in most cases at least). That's why we use `===` instead, which first checks if the types are equals, before it checks if the values are equal.


The next thing are `if` statement. An `if` statement has one or two so called branches (the second being the optional `else` branch), based on a `boolean` value. The first branch or block is only executed if the value `=== true`, and the second block - if there is one - only executes if the value `=== false`. Let's see this in code:

    var b = true;
    if (b) {
        console.log('I like Alice');
    }

    if (!b) {
        console.log('I like Bob');
    } else {
        console.log('I like Charlie');
    }

If we execute the code, we will be once again seeing that we do not like Bob, but we do like Alice and Charlie. The second `if`-condition is `!b`, which equals `false`, therefore we only execute the else branch of the second `if` statement.


Let's combine this into our program. We will be assuming that we only care for the first argument if there are multiple, mainly for simplicity.

    var message = 'hello ';
    var args = process.argv.slice(2);
    var number_of_arguments = args.length; //gives us a number that is the number of arguments given
    if (number_of_arguments < 1) {
        message += 'world'; //can you guess what += does?
    } else {
        var name = args[0];
        if (name !== 'Bob') {
            message += name;
        } else {
            message = 'go home bob';
        }
    }
    console.log(message);

We are also experiencing for the first time code indentation. For the computer it's irregardless, but for a programmer it's easier to align code within a specific block by a number of spaces compared to the code outside that block. Visual Studio Code can automatically do this kind of formatting via `ALT+CTRL+L`.

Try executing our first dynamic program with multiple inputs:

    $ node app.js
    $ node app.js Bob
    $ node app.js Alice


Congratulations, now you know how to use program arguments, and how to use conditional statements to influence your execution flow.

# Making our program interactive

Sometimes restarting our project with new arguments is not enough. Instead, we want to influence the program while it is running. Most programs we interact with work like that: Your code editor does, your operating system, your browser, even the web server serving this blog post isn't restarted again and again, but instead listens for input and changes its behavior based on that input.

The simplest kind of input is textual input from the terminal. In this case, we can write normal text in the console. Everytime we use the enter key to finish a line, this line gets send to the current program as a 'string', which can be used normally.

We will be writing a string collector: we can give it any string besides 'exit' and 'list', and it will add this string to one big array. If we enter 'list' it will instead print out each string in order. If we enter 'exit' it will end our program - as long as we don't enter 'exit', our program should continue and keep asking us for new strings.

Back to reading in code. Let's define a so called `function` that prompts the user with a question and a callback. A callback is also a function. Let's first talk about what a `function` is in general:

    function my_function(argument_1, argument_2, argument_3) {
        console.log(argument_2 + argument_3);
        return argument_1;
    }

A function consists of a name `my_function`, zero or more arguments (in this case `argument_1`, `argument_2`, `argument_3`) and a `body`, which is a block of code. The definition always starts with the keyword `function`, which is mandatory in JavaScript. We can define functions like this, or even assign them as values to a variable:

    var f = my_function;

A function defined either way does nothing by itself, but we can invoke them later on:

    var x = my_function(4, 5, 6); //logs 11, and sets x = 4
    var y = f(7,8,9); //logs 17, and sets y = 7

This allows us to write code once and reuse it multiple times without repeating it. It's the core way of splitting complex programs into separate and easy to manage parts. It's only important we define the function before using it. If we don't, the function is `undefined`, which will throw an error if we try to invoke it.

Now we know what a function is. We already now preexisting methods, like `console.log` of the global `console` object. A method is just a field of an object containing a function as a value, so it's mostly a matter of naming, nothing else. A `callback` meanwhile is a function argument that is itself a function - we know that we can assign functions as values to variables, so of course we can also use them as arguments to a function. Callbacks are often used in Node.js if the control flow shouldn't be linear from top to bottom anymore. Our example project will hopefully bring light into this concept.


Let's start by defining a `prompt` function, that is accessing objects `stdin` (the standard input) and `stdout` (the standard output), both defined by Node.js to enable these kinds of programs. We 

    function prompt(question, callback) {
        var stdin = process.stdin;
        var stdout = process.stdout;
        stdout.write(question);
        stdin.once('data', function (data) {
            callback(data.toString().trim());
            prompt(question, callback);
        });
    }

It takes a question (we assume this is a string), prints it to `stdout`, followed by this call to `stdin.once()`, which takes itself a function without a name as a callback, and calls our callback in the process. The next time the user uses the enter key to end the line, this callback is executed, translates the data into a string, uses `trim()` (removing whitespaces left and right of the string), and gives the resulting string to our callback. Afterwards it calls itself, waiting for the next line to be inserted by the user


Next up, let's build our control flow that waits for `'exit'` to be entered:


    var my_array = [];
    var question = 'What string to you want to add to the array?';
    var callback = function(str) { //str is our line
        if (str === 'exit') {
            process.exit(); //ends the programm when called
        }  else {
            if (str === 'list') {
                for (var element of my_array) {
                    console.log(element);
                }
            } else {
                my_array.push(str);
            }
        }
    };
    prompt(question, callback);



Make sure you define the `prompt` function first, or the programm will throw an error.


Congratulations, now you know how to read data from the terminal while the program is running, and also about functions, and how to separate functionality. Our last code has been getting a lot bigger than our code before. Even though 25 lines of code isn't much, major programs often take 10, 100, or even 1000 times that. It makes sense to split that code into multiple smaller files, to make them easier to read, and even reusable.


# Refactoring our code into multiple files
As the last step for this part of the series, we will be talking about how to distribute your code into multiple source files. While previously we only had one file named `app.js`, we are now adding another called `terminal.js`, with functions and variables related to the terminal that we will use inside `app.js`.

There are multiple ways of doing this kind of split, but the best way is to build a so called JavaScript `module`. This will help us understand `npm` in the upcoming third part of the series. For now, make a new file `terminal.js` in the same folder as your `app.js`. We will be moving the `prompt` function into this new file, but using the so `module exports` functionality:

    exports.prompt = function (question, callback) {
        var stdin = process.stdin;
        var stdout = process.stdout;
        stdout.write(question);
        stdin.once('data', function (data) {
            callback(data.toString().trim());
            exports.prompt(question, callback);
        });
    }

In terms we already understand, `exports` is an object that represents our module. Only functions and variables defined as fields of that object can be seen and directly used by other files. This is useful to hide internal complexity, and only export simpler functions.

Our main file, `app.js`, meanwhile doesn't contain the `prompt`function anymore. Instead, we have to load our module with the `require` function, that takes the (relative) filepath to the other sourcefile, and returns the `exports` object, which we normally assign to a local variable:

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

Congratulations! Now you know how to use `modules` to separate code into multiple files, and access that code in other JavaScript files.

# Conclusion
In this part we learned about JavaScript types, including arrays and objects. We also have shortly visited simple loops of arrays, conditional statements via `if` and explained how to use functions to make code reusable, and explained how the `module` system can be used to reuse this code in multiple applications. Finally, besides printing data to the console, we have also learned how to use program arguments, and how to read in data directly from the console.

Next up in part 3 we will be talking about how to write our first HTTP server, and how to use `npm` to use modules written by other users worldwide in our own code.

# Your homework
If you want to strengthen what you have learned, it's best to do some programming tasks yourself, ideas for which you will find in this homework section at the end of every post.


* Write a basic calculator that is used like `node app.js 4 * 5` and prints out `20` on the console. It should deal `*`, `+`, `-`, and `/`. Try testing your code with different operands too. Does it work with `0` too? Or even `-1`? What happens in case of `node app.js 1 / 0`? Can you explain this behavior?
    * You may be wondering on how to convert back from `string` to `number`. Just use `var my_number = parseFloat(my_string);`. This is a global function already defined in ECMAScript 2015 and newer.
* Can you extend the calculator to take more than 2 operands, like `node app.js 4 * 5 + 3 * 6`? For simplicity, do not include parantheses and compute the most left operand first, which would equal `(((4 * 5) + 3) * 6) = 138` in the given case.
* Advanced task: Can you implement the right order? This equals `((4 * 5) + (3 * 6)) = 38`.

