
#### Sass
```
#main p {
  color: #00ff00;
  width: 97%;

  .redbox {
    background-color: #ff0000;
    color: #000000;
  }
}
```

compiled to:
#### CSS
```
#main p {
  color: #00ff00;
  width: 97%; }
  #main p .redbox {
    background-color: #ff0000;
    color: #000000; }
```    

#### Sass
```
a {
  font-weight: bold;
  text-decoration: none;
  &:hover { text-decoration: underline; }
  body.firefox & { font-weight: normal; }
}
```    

compiled to:
#### CSS
```
a {
  font-weight: bold;
  text-decoration: none; }
  a:hover {
    text-decoration: underline; }
  body.firefox a {
    font-weight: normal; }
```    
#### Variables
`width: $width;`
```
#main {
  $width: 5em !global;
  width: $width;
}

#sidebar {
  width: $width;
}
```

##### Mixin
defining mixin
```
@mixin large-text {
  font: {
    family: Arial;
    size: 20px;
    weight: bold;
  }
  color: #ff0000;
}
```
This takes the name of a mixin and optionally arguments to pass to it,
and includes the styles defined by that mixin into the current rule
```
.page-title {
  @include large-text;
  padding: 4px;
  margin-top: 10px;
}
```

Variables are only available within the level of nested selectors where they’re
 defined. If they’re defined outside of any nested selectors, they’re available
 everywhere. They can also be defined with the !global flag, in which case
 they’re also available everywhere.

http://sass-lang.com/documentation/file.SASS_REFERENCE.html#import
