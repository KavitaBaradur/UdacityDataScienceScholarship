# This is the number we'll find the factorial of - change it to test your code!
number = 6
# We'll start with the product equal to the number
product = number

# TODO: Write a for loop that calculates the factorial of our number
for i in range(1,number,1):
    product = product*i

# TODO: print the factorial of your number
print(product)