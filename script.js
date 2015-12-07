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
