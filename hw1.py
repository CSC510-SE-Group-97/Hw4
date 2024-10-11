def add_numbers(a, b):
    return a + b

def print_sum(x, y):
    sum = add_numbers(x, y)
    print(f"The sum of {x} and {y} is: {sum}")

print_sum(3, 5)
print_sum("3", 5)  # Error: Mixing string and integer
