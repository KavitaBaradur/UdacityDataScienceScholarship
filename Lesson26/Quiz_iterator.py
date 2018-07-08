lessons = ["Why Python Programming", "Data Types and Operators", "Control Flow", "Functions", "Scripting"]

def my_enumerate(iterable, start=0):
    # Implement your generator function here
    count = start
    for item in iterable:
        yield count,item
        count +=1


for i, lesson in my_enumerate(lessons, 1):
    print("Lesson {}: {}".format(i, lesson))


# 2nd Question
def chunker(iterable, size):
    # Implement function here
    for i in range(0, len(iterable),size):
        yield iterable[i:i+size]


for chunk in chunker(range(25), 4):
    print(list(chunk))