#### Arrays
```ruby
grocery_list = Array.new || grocery_list = []

grocery_list = ['milk', 'eggs', 'bread', 1, 3, 5] || grocery_list = %(milk eggs bread)
```
Adding to an Array
```ruby
grocery_list << 'carrots' # add to the end of the array
grocery_list.push('potatoes') # add to the end of the array
grocery_list.unshift('celery') # add to beginning
grocery_list += ['ice cream', 'pie'] # add to the end of the array

puts grocery_list.inspect # prints the Array
```
Additional methods to call on an Array
```ruby
grocery_list = ['milk', 'eggs', 'bread', 'ice cream', 'pie', 'potatoes']
grocery_list.insert(2,'oatmeal') # adds oatmeal to the 2 index position
grocery_list.count('eggs') # => 1  counts either the array or amount of objects
grocery_list.include?('eggs') # => true # boolean if it's in the array
last_item = grocery_list.last # calls last item in array

last_item = grocery_list.pop # => 'potatoes'
first_item = grocery_list.shift # => 'milk'
```
#### Hash
key = unique identifier, can be string, symbol, number, or obj

value = string, number, or symbol

```ruby
item = Hash.new || { }
grades = Hash.new
grades['Dorthy Doe'] = 9
```
Syntax
```ruby
item = { 'item' => 'Bread', 'quantity' => 1 }
grades = { 'Jane Doe' => 10, 'Jim Doe' => 6 }
```
Symbols
```ruby
options = { :font_size => 10, :font_family => 'Arial' }
# Hashes allow an alternate syntax form when keys are always symbols
options = { font_size: 10, font_family: 'Arial' }

# Each named key is a symbol you can access in a hash
options[:font_size]  # => 10
```
If a hash is the last argument on a method call, no braces are needed
```ruby
Person.create(name: "John Doe", age: 27)

def self.create(params)
  @name = params[:name]
  @age  = params[:age]
end
```
Set default value
```ruby
# Hashes have a default value when accessing keys that do not exist in the hash
grades = {'Timmy Doe' => 8 }
# these can be accessed by calling the default method
# if no default is set, nil is used
grades.default = nil
grades = Hash.new(0)
grades.default = 0
```
Access the value in a Hash by using it's key
```ruby
puts grades['Jane Doe'] # => 10

Hash['a', 100, 'b', 200] #=> {'a'=>100, 'b'=>200} keys and values occur in pairs
Hash[ [ ['a', 100], ['b', 200] ] ] #=> {'a'=>100, 'b'=>200} array of key value pairs
Hash['a' => 100, 'b' => 200] #=> {'a'=>100, 'b'=>200} obj convertible to a hash
```
The default value returned depends on the style of new used to create the Hash
```ruby
h = Hash.new('Go Fish')
h['a'] = 100
h['b'] = 200
h['a'] # => 100
h['c'] # => 'Go Fish'
```
alters and stores the new default obj because of the bang symbol used
```ruby
h['c'].upcase! # => 'GO FISH'
h['c'] # => 'GO FISH'
```
calling the keys method, prints the keys that have values
```ruby
h.keys # => ['a', 'b']
```

Creates new default object each time
```ruby
h = Hash.new { |has, key| hash[key] = 'Go Fish: #{key}'}
h['c'] # => 'Go Fish: c'
h['c'].upcase! # => 'GO FISH: C'
h['d'] # => 'Go Fish: d'
h.keys # => ['c', 'd']
```
freeze a key and compare its value using `equal?` or `compare_by_identity?`
```ruby
a = 'a'
b = 'b'.freeze
h = { a => 100, b => 200 }
h.key(100).equal? a #=> false
h.key(200).equal? b #=> true
```
if the key is not found, returns the default value. If the optional code block is given, and the key is not found, pass in the key and return the result of the block
```ruby
h = { 'a' => 100, 'b' => 200}
h.delete('a') # => 100
h.delete('z') # => nil
h.delete('z') { |el| '#{el} not found'} # => {'a' => 100}
```
Conditionally deletes key-value pair
```ruby
h = { 'a' => 100, 'b' => 200, 'c' => 300 }
h.delete_if {|key, value| key >= 'b' }  # => {'a', 100}
```
Calls block once for each key in hash, passing the key-value pair as params
```ruby
h = {'a' => 100, 'b' => 200}
h.each {|key, value| puts '#{key}' is '#{value}'}

a is 100
b is 200
```
Calls block once for each key in Hash, passing key as param
```ruby
h = {'a' => 100, 'b' => 200}
h.each_key {|key| puts key}

a
b
```
Calls block once for each key in Hash, passing value as param
```ruby
h = {'a' => 100, 'b' => 200}
h.each_value {|value| puts value}

100
200
```
Conditional operators true or false
`{}.empty?`
`eql?(other_hash)` if both hashes have the same content
`h.has_key?('a')` if the given key is present for some value in hash
`h.has_value?('100')` if the given value is present for some key in hash
`h.include?('100')` if the given value is present for some key in hash
