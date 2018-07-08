names = ["Rick Sanchez", "Morty Smith", "Summer Smith", "Jerry Smith", "Beth Smith"]

first_names = [name.split()[0].lower() for name in names]# write your list comprehension here
print(first_names)

# 2nd question
multiples_3 = [3*i for i in range(1,21)]# write your list comprehension here
print(multiples_3)

# 3rd question
scores = {
             "Rick Sanchez": 70,
             "Morty Smith": 35,
             "Summer Smith": 82,
             "Jerry Smith": 23,
             "Beth Smith": 98
          }

passed = [name for name,score in scores.items() if score>=65]# write your list comprehension here
print(passed)