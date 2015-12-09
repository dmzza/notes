/********************************
JavaScript Intro
*********************************/

Cmd + Option + C
  #launches Safari console

  <script src="script.js"></script>
  #links JavaScript file to a webpage

  alert("hello there");
  document.write("Now it works!");
  console.log("program complete");
  #sample commands

  <script>
    alert("hello there");
    console.log("Begin program");
    document.write("Welcome to JavaScript Basics");
    console.log("End program");
  </script>
  #inserts JavaScript directly into webpage

/********************************
Variables
*********************************/
  var myName = "David";
  alert(myName);
  myName = "Not David anymore";
  alert(myName);
  #'var' is only used to create the variable name, not reassign its value

  https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords
  #current and future reserved variable names
  #variable name cannot start with a number
  #can only contain letters, numbers, $ and _
  #can capitalize every letter after the first

/********************************
Two Common Value Types: Strings & Numbers
*********************************/
  #strings can use '' or "", just have to remain consistent
  var htmlSnippet = '<h1 class = "special">Important Headline</h1>';

  var message = 'She\'s a great person!';
  #backslash character serves as an escape charater, quote mark is ignored

  prompt('What is your name?');
  var visitorName = prompt('What is your name?');
  alert(visitorName);
  console.log(visitorName);

  var visitor = prompt('What is your name?');
  var message = 'Hello' + " " + visitor;
  #concatenation, combining strings or variables
  document.write(message);

  var message = "Hello" + visitor + " .Welcome to Treehouse. ";
  message = message + "We are so glad that you came by to visit, ";
  message += "please come again, when you want to learn some more.";
  #same updates the variable

/********************************
Working With Strings & Variables
*********************************/
  var passphrase = "Open Sesame";
  console.log(passphrase.length);
  #objects can be a string, the document, the browsers console, variable
  #objects have properties such as length of a string
  #objects have mehtods, which are actions the object can perform.
