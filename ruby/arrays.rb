# Arrays

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
