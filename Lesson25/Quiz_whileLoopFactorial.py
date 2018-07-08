# Start with a sample number for first test - change this when testing your code more!
number = 6
# We'll always start with our product equal to the number
product = number

# TODO: Write while loop header line - how will you tell it when to stop looping?
while number>1:
    # TODO: Each time through the loop, what do we want to do to our number?
    number-=1
    # TODO: Each time, what do we want to multiply the current product by?
    product = product*number
# TODO: Print out final product (how do we indicate this should happen after loop ends?)
print(product)