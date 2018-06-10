---
categories : ["NodeJS", "Progamming"]
tags : ["tutorial", "backend", "server"]
date : "2018-06-09"
description : "Learn how to program Hello World in Node.js"
image : "img/2018/06/node-js-logo.png"
title : "Node.js for beginners: Part 1 (of ∞)"
type : "post"
draft : false
weight : 1
showonlyimage : false
---

# What is JavaScript?

JavaScript started out as a simple way of enabling interactivity and dynamic content in websites. JavaScript can be embedded in a website, which your browser will see, and execute the encoded program. 

Because otherwise it would be a gigantic security risk, browsers sandbox the execution of those programs, and only allow specific actions that these programs can do. One no-go is file access: JavaScript programs are not allowed to read or write files on your computer. To store data, browser manufacturers introduced such API's like `localStorage` or `indexedDB`, which at least allows the JavaScript programs to persist data on your computer - but it still cannot read your other files, or even data stored by another website.

Another limitation are servers: to write a web server, you have to execute so called Sockets of your Operating Systems, which deal with incoming and outgoing network traffic. It would be horrible if a website could suddenly listen to all your incoming or outgoing traffic just because you visited it once, so this is also strictly forbidden. You see how JavaScript is very limited because of where and how it is used.


There is no real connection between JavaScript and Java, but JavaScript is heavily inspired by patterns introduced by Java, and also part of the syntax family that includes C, C++, Java, and C#. The naming is still mostly marketing, and the actual JavaScript we use today is standardized under the name [ECMAScript](https://en.wikipedia.org/wiki/ECMAScript).

There is a great article on auth0's blog on JavaScript's history(https://auth0.com/blog/a-brief-history-of-javascript/), which I can recommend if you're interested. 

So JavaScript was important for dynamic websites, and has a lot of limitations on what it can do. This is nice, but this is not what this blog series is going to talk about. Instead, we will be using JavaScript on the server side, using something called Node.js. 

# What is Node.js?

Node.js was invented in 2009 by Ryan Dahl and combines Google's V8 JavaScript engine (the core reason why the Chrome browser was so much faster than others at the time), an I/O API, and an event queue. While this doesn't seem like much, it suddenly allowed writing JavaScript applications that were working as web servers, or accessing the file system, or even querying databases. And all that while delivering high performance.

One of the reasons for this kind of performance is that Node.js is non-blocking, but also single-threaded. This is possible because of the event queue we were talking about: Instead of waiting for an operaton to finish (like opening / reading a file, or querying a remote server), the program spawns an event, which is added to the main event queue once the operation is finished. The program itself listens to those events. Therefore, no time is wasted waiting for outside operations, except if there is nothing else to do. If this all sounds confusing, don't worry. We will only be introducing such events slowly starting in part 2.

For simplicity, Node.js is just a basic program called `node`, which takes JavaScript files and executes them outside a browser, with no hard limitations on functionality.

# What kind of program can I create with Node?

This is the clou of Node.js: While traditional JavaScript was limited to the browser, Node.js allows us to use a lot more functionality, including access to files, and sockets, making Node.js perfect for:

* web servers
* file processing
* data collection
* data analysis

The biggest competing ecosystems with the same capabilities are Java, and the .NET framework.

# Installing requirements

We will require two tools: Node.js itself (which helps us executing our JavaScript programs) and a code editor, which helps us writing our JavaScript programs in the first place. In our case we will be using Microsoft's cross-plattform Visual Studio Code to write our JavaScript.

## Node.js and NPM

You can install Node.js from [https://nodejs.org](https://nodejs.org). Please look on the official site for explanations on how to best install it on your Unix or Windows machine. For Windows, you may just download the current version of Node.js as an `.msi` installer package and execute this installer.

You will also find that Node.js includes something called `npm`, the Node Package Manager. We will explain in future blog posts on what this is for and how to use it.


## Visual Studio Code

We will be using Visual Studio Code (short: VS Code) in these blog posts, which you can install from [https://code.visualstudio.com/](https://code.visualstudio.com/).

There is no mandatory need for VS Code, and many people have their own favorit text / code editor. What's important is that you get Syntax Highlighting for JavaScript. IntelliSense - as far as possible for JavaScript - is also a nice feature. VS Code includes both, and also an integrated terminal and a great number of available extensions, which is why I'm recommending it.

Once you have installed VS Code, open it. You should see the following.

{{< figure src="/img/2018/06/vscode_landing_page.PNG" width="100%" title="What you see when opening Visual Studio Code with no open directory or file" >}}
# First program: 'Hello World' in Node.js

Now we will actually create a real application. Applications in Node.js are source code files which we can run with the `node` command on our terminal, so running a file called `abc.js` would simple mean executing `node /path/to/abc.js` in our terminal. The file ending `.js` is irrelevant to the execution and only there to make it clear we are writing JavaScript files - but it's still recommended to always use the right file endings!

To begin, create a new folder and open it in Visual Studio Code. You may do so by using `File > Open folder...`. Now create a new file in this folder called `app.js`. You may open this file in the editor tab by doublecliking it in the left explorer pane. If you do not see the explorer pane, click on the 'files' symbol on the left side of Visual Studio Code.  

{{< figure src="/img/2018/06/vsc_new_js_app.PNG" width="100%" title="You now have a folder containing one empty JavaScript file" >}}


Now enter into this file 

    console.log('Hello World');

Let's unwrap this first line of code:

* We are using the built-in `console` object and execute the `.log()` method on it. This method takes an argument and prints, or "logs" it to the console, which is our terminal.
* Inside the parantheses we enter `'Hello World'` as an argument. This is a so called `string literal` in JavaScript. A string is a chain of characters and begins and ends with `'` (in other languages we often use double quotes, which is also possible but not recommended in JavaScript). Our function will therefore not print both `'`, only the text between them.
* We call such a line of code a statement. Statements end with `;`. A program executes all statements in one order. For now this order is top-down: The program starts executing the first line, and continues with the next one afterwards, ending if there is no statement left to execute. We will see how to achieve other forms of this so called "control flow" in future blog posts.

Let's finally execute our first program! As we explained at the start of this section, you have to only execute `node app.js` in a terminal while inside this folder. If you are new to terminals and command lines, don't worry, Visual Studio Code can help us!


{{< figure src="/img/2018/06/vscode_terminal.PNG" width="100%" title="VS Code has an integrated terminal to easily execute commands" >}}


You can open the terminal embedded into VS Code by pressing `ALT+F12` or by pressing `F1`, entering `terminal` and executing the command `Toggle Integrated Terminal` with a press on Enter. This terminal will automatically open inside the given folder.

Now enter `node app.js` and press Enter to execute the command. It will immediately print out the message in a new line and end the program, giving you a new command prompt (which begins with `$`, so don't be confused by that).

{{< figure src="/img/2018/06/vscode_terminal_hello.PNG" width="100%" title="Executing our first JavaScript program prints out 'Hello World' to the terminal" >}}


## Adding variables and multiple lines 

We still have a little time left, so let's add some more code to our application, which gives us a little taste of what comes in part 2.

Enter the following JavaScript code into the file:


    console.log('Hello World');
    var x1 = 7;
    var x2 = 6;
    var s = 'the answer is ' + (x1 * x2);
    console.log(s);


This brings us up from 1 to 5 statements. One of the new things are variables, declared by a starting `var`, and assigned a value via `=`. 

That means `var x1 = 7;` creates a new variable with the name `x1` and assigns it the number 7. If you remember your math classes this shouldn't be surprising to you, but you are probably used to do this with numbers.

`var s = 'the answer is ' + (x1 * x2);` is another variable, but we do not assign a number to it. Instead we assign a `string`. And not enough, we also use `+` and `*` on the right side, but `x1` equals a number (7) and `x2` too (6). How can we combine a `string` with two numbers?

Let us first follow the parantheses, which declare that `*` comes before `+`. We can simple the right side term from `'the answer is ' + (x1 * x2);` to `'the answer is ' + 42;` by replacing the variables with their current value and calculating `7 * 6`. Now we have a `string`, a `+`, and a `number`. JavaScript (and many languages) start with the left operand (our `string`), and look up the definition of the operand (`+`) based on that left operand. For a `string`, `+` does not mean addition, but concatenation: putting a second string immediately after the first, so `'abc' + 'def'` equals `'abcdef'`. The final clue to this mystery is type conversion: concatenation can only deal with two strings, but JavaScript can convert the type of operands automatically. There is an automatic conversion from a number to a `string`, and in this case it's from `42` to `'42'`. We now have two strings, and concatenation is suddenly well defined.

Type conversion is a complicated issue and one of the reasons JavaScript is so much disliked by programmers: it's not always clear which types are automatically converted into what other types. We will be talking about this problem and how to best deal with it in future parts.

If you want to see the final result of the concatenation for yourself, execute the new program by running `node app.js` inside the terminal another time.

{{< figure src="/img/2018/06/vsc_vars_done.PNG" width="100%" title="The answer is 42, who would have thought?" >}}

Congratulations! You now also know about variables, numbers, multiple statements, concatenations of strings, conversion between numbers and strings, and basic arithmetic. A lot of new stuff in only 4 new lines of code!

# Conclusion
We have installed Node.js and a text editor with Syntax Highlighting for JavaScript. We have also wrote our first basic application in Node.js, showing us how to use variables, write basic code, and print out data.

In the second part of this series we will talk about data types and more on variables in JavaScript, and we will also show how we can distribute code into reusable functions and even multiple files for a better oversight. This will lead us into part 3 where we will program our first HTTP server, and look deeper into what NPM is and how it helps us build bigger things faster.
Part 2 will be coming soon, so keep your eyes up! 

You might also watch out for my blog post 'Git for first-timers - managing your progress and files' which deals with source code management and version control. For any programming project of more than 10 lines of code this is almost a mandatory process!
