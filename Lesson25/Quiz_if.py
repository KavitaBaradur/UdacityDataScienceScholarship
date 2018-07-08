points = 174  # use this input to make your submission
prize=''
result=''

# write your if statement here
if points>=1 and points<=50:
    prize = 'wooden rabbit'
    result = "Congratulations! You won a " +prize+"!"
elif points>=51 and points<=150:
    prize = 'no prize'
    result = "Oh dear, "+prize+" this time."
elif points>=151 and points<=180:
    prize = 'wafer-thin mint'
    result = "Congratulations! You won a " +prize+"!"
elif points>=181 and points<=200:
    prize = 'penguin'
    result = "Congratulations! You won a " +prize+"!"

print(result)