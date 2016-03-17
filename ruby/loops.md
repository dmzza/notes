#### Ruby Loops

```ruby
loop do
  print 'Do you want to continue ? (y/n)'
  answer = gets.chomp.downcase
  if answer == 'n'
    break
  end
end
```
only if takes one line of code
```ruby
loop {
  print 'Do you want to continue ? (y/n)'
  answer = gets.chomp.downcase
}
```

Generate random number with a max digit
```ruby
random_number = Random.new.rand(5)
loop do
  print 'Guess the number between 0 and 5 (e to exit)'
  answer = gets.chomp
  if answer == 'e'
    puts 'The number was #{random_number}.'
    break
  else
    if answer.to_i == random_number
      puts 'You guessed correctly!'
      break
    else
      puts 'Try again'
    end
  end
end
```

Store input as integer
```ruby
loop do
  print 'Enter a number greater than 10 to exit: '
  answer = gets.chomp.to_i
  if answer > 10
    break
  end
end

def get_name
  name = ''
  loop do
    print 'Enter your name: '
    if name.length >= 2 && !name.index(/\d/)
      break
    else
      puts 'Name must be longer than 2 characters and not contain numbers.'
    end
  end
  return name
end

name = get_name
puts "Hi #{name}."
```

##### While Loop
Break is not needed
```ruby
answer = ''
while answer != 'n'
  print 'Do you want me to repeat this pointless loop again? (n/y)'
  answer = gets.chomp.downcase
end

def print_hello(number_of_times)
  i = 0
  while i < number_of_times
    puts 'Hello'
    i += 1
  end
end

answer = 0
while answer < 5
  print 'How many times do you want to print hello? (Enter a number greater than 5 to exit)'
  answer = gets.chomp.to_i
  print_hello(answer)
end
```

define answer as empty string, or else it would be nil
```ruby
answer = ''
until answer == 'no' do
  print 'Do you want this loop to continue? (y/n)'
  answer = gets.chomp
end
```

until/while loops use do optionally
