# write your function here
def population_density(population,land_area):
    return population/land_area

# test cases for your function
test1 = population_density(10, 1)
expected_result1 = 10
print("expected result: {}, actual result: {}".format(expected_result1, test1))

test2 = population_density(864816, 121.4)
expected_result2 = 7123.6902801
print("expected result: {}, actual result: {}".format(expected_result2, test2))

# 2nd Question
# write your function here
def readable_timedelta(total_days):
    week = (int)(total_days/7)
    days = total_days%7
    output = str(week)+" week(s) and "+str(days)+" day(s)."
    return output

# test your function
print(readable_timedelta(10))