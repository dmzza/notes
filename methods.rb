grocery_list = Array.new || grocery_list = []

grocery_list = ['milk', 'eggs', 'bread', 1, 3, 5] || grocery_list = %(milk eggs bread)

grocery_list << 'carrots' # add to the end of the array
grocery_list.push('potatoes') # add to the end of the array
grocery_list.unshift('celery') # add to beginning
grocery_list += ["ice cream", "pie"] # add to the end of the array

puts grocery_list.inspect
grocery_list = ["milk", "eggs", "bread", "ice cream", "pie", "potatoes"]
grocery_list.insert(2,'oatmeal') #adds oatmeal to the 2 index poisition
grocery_list.count('eggs') => 1 # counts either the array or amount of objects
grocery_list.include?('eggs') => true # boolean if it's in the array
last_item = grocery_list.last # calls last item in array

last_item = grocery_list.pop => 'potatoes'
first_item = grocery_list.shift => 'milk'

# def get_name()
#   print "Enter your name: "
#   return gets.chomp
# end
#
# def greet(name)
#   puts "Hi #{name}!"
#   if (name == "Jason")
#     puts "That's a great name!"
#   end
# end
#
# def get_number()
#   print "What number would you like to test?"
#   return gets.chomp.to_i
# end
#
# def divisible_by_3(number)
#   return (number % 3 == 0)
# end
#
# name = get_name()
# greet(name)
# number = get_number()
#
# if divisible_by_3(number)
#   puts "Your number is disible by 3!"
# else
#   puts "Your number is not cleanly divisible by 3"
# end
