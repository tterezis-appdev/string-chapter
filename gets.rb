# Write a program that gets a name (e.g. "alice") from the user, removes
# any newline character, capitalizes it, and then says "Hello, Alice!"

# Should work similarly to the following:
# 
# "What's your name?"
# hannah
# "Hello, Hannah!"

p "What's your name?"

name = gets


#### SOLUTION

# name = gets.chomp.capitalize
# p "Hello, #{name}!"
