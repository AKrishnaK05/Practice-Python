# Input and Output
name = input("Enter your name:")
print(f"Hello {name}, Welcome to the world of python.")

# Data types
int_num = 10
float_num = 5.23
complex_num = 2 + 3j
string = "Hello, World"
boolean = False
list_example = [12,32,54,35]
tuple_example = (12,23,34,67)
dict_example = {"a":23,"b":23,"c":45}
set_example = {12,23,45,67}

# Expressions and Operators
a = 10
b = 5

# arithmetic operators
print(a+b) 
print(a-b)
print(a*b)
print(a/b)
print(a//b)
print(a%b)
print(a**b)

# comparison operators
print(a==b)
print(a!=b)
print(a>b)
print(a<b)
print(a>=b)
print(a<=b)

# logical operators
print(a>6 and b<6)
print(a>6 or b<3)
print(not(a>6 and b<6))

# Type Casting
int_from_float = int(5.32)
float_from_int = float(52)
string_from_int = str(34)
list_from_string = list("Apple")
tuple_from_list = tuple([1,2,3,4,5])
set_from_list = set([1,2,3,4,5])

print(int_from_float)
print(float_from_int)
print(string_from_int)
print(list_from_string)
print(tuple_from_list)
print(set_from_list)

# Conditional statements
a = 5
b = 10

if a == b:
    print("The numbers are equal.")
elif a > b:
    print(f"{a} is greater than {b}.")
else:
    print(f"{a} is lesser than {b}")

# Looping Statements
colour = ["Violet","Indigo","Blue","Green","Yellow","Orange","Red"]

    # For loop
for i in colour:
    print(i)

    # While loop
n = 0
while n < len(colour):
    print(colour[n])
    n = n+1

# Jumping Statements
    # Break statement
for i in range(10):
    if i==5:
        break
    print(i)

    # continue statement
for i in range(10):
    if i==5:
        continue
    print(i)

# Special Functions
colour = ["Violet","Indigo","Blue","Green","Yellow","Orange","Red"]
 
    # len()
print(len(colour))

    # id()
print(id(colour))

    # type()
print(type(colour))

    # range()
for i in range(5):
    print(i)

# Functions in python

def calculate_area(length,breadth=5):
    return length * breadth

# Positional argument
area = calculate_area(5,4)
print(area)
# Keyword argument
area = calculate_area(breadth=7,height=3)
print(area)
# Default argument
area = calculate_area(5)
print(area)

# Passing functions as arguments

def shout(text):
    return text.upper()
def whisper(text):
    return text.lower()
def modify_text(text,func):
    return func(text)

yelled_text = modify_text("Hello World",shout)
print(yelled_text)

# Lambda

# simple addition
add = lambda a,b : a+b
result = add(5,4)
print(result)

# String Formatting
greeting = lambda name : f" Hello {name}"
message = greeting("Adwaid")
print(message)

# Sorting a list
fruits = ["Apple","Banana","Mango","Grapes"]
sorted_words = sorted(fruits,key = lambda word: len(word))
print(sorted_words)

# map()
numbers = [1,3,5,6,8]
squared_numbers = map(lambda x: x**2,numbers)
print(list(squared_numbers))

# filter()
numbers = [1,2,3,4,5,6,7]
even_number = filter(lambda x: x%2==0,numbers)
print(list(even_number))

# reduce()
from functools import reduce
numbers = [1,2,3,4]
product = reduce(lambda x,y: x*y,numbers)
print(product)

# Area Calculator
def calculate_area(shape,dimension):
    if shape == "rectangle":
        if "length" in dimension and "breadth" in dimension:
            length = dimension["length"]
            breadth = dimension["breadth"]
            area = lambda x,y: x*y
            result = area(length,breadth)
            return result
        
    elif shape == "circle":
        if "radius" in dimension:
            radius = dimension["radius"]
            area = lambda x: 3.14*x*x
            result = area(radius)
            return result
        
    else:
        print("Enter valid shape.")
    
area=calculate_area("rectangle",{"length":5,"breadth":4})
print("Area of rectangle:",area)

area = calculate_area("circle",{"radius":7})
print("Area of circle:",area)