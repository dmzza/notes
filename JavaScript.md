# JavaScript Intro
`Cmd + Option + C`
launches Safari console

`<script src="script.js"></script>`
links JavaScript file to a webpage

```js
alert("hello there");
document.write("Now it works!");
console.log("program complete");
```
sample commands

```html
<script>
  alert("hello there");
  console.log("Begin program");
  document.write("Welcome to JavaScript Basics");
  console.log("End program");
</script>
```
inserts JavaScript directly into webpage

# variables
```js
var myName = "David";
alert(myName);
myName = "Not David anymore";
alert(myName);
```
'var' is only used to create the variable name, not reassign its value

`https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords`
  - current and future reserved variable names
  - variable name cannot start with a number
  - can only contain letters, numbers, $ and _
  - can capitalize every letter after the first

# two common value types: strings & numbers
strings can use '' or "", just have to remain consistent
`var htmlSnippet = '<h1 class = "special">Important Headline</h1>';`

`var message = 'She\'s a great person!';`
backslash character serves as an escape charater, quote mark is ignored

```js
prompt('What is your name?');
var visitorName = prompt('What is your name?');
alert(visitorName);
console.log(visitorName);
```
```js
var visitor = prompt('What is your name?');
var message = 'Hello' + " " + visitor;
```
concatenation, combining strings or variables
`document.write(message);`

```js
var message = "Hello" + visitor + " .Welcome to Treehouse. ";
message = message + "We are so glad that you came by to visit, ";
message += "please come again, when you want to learn some more.";
```
same updates the variable

# working with strings & variables
`var passphrase = "Open Sesame";`
`console.log(passphrase.length);`
  - objects can be a string, the document, the browsers console, variable
  - objects have properties such as length of a string
  - objects have mehtods, which are actions the object can
  - perform. .write  or .toUpperCase()
```js
var stringToShout = prompt('What should I shout?');
var shout = stringToShout.toUpperCase();
shout += '!!!';
alert(shout);
```
```js
var adjective = prompt('Please type an adjective');
var verb = prompt('Please type a verb');
var noun = prompt('Please type a noun');
alert('All done. Ready for the message?');
var story = '<h2>There once was a ' + adjective;
story += ' programmer who wanted to use JavaScript to ';
story += verb + ' the ' + noun + '.</h2>';
document.write(story);
```
adlib story program

# numbers
Integers        |       Floating Point Numbers      |       Scientific Notation
:--------------:|:---------------------------------:|:-------------------------:
        5       |                 3.14              |             9e-6
        0       |               -9.8888             |             9e+6
      -100      |                0.0009             |
      9999      |                                   |
