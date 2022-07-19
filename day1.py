#whiteboard of the day
# Find Even numbers
# Create a function that, given a list as a parameter, finds the even numbers inside the list. 
# The function should then return a list.
# Example:
# Input: [2, 7, 10, 11, 12]
# Output: [2, 10, 12]


def evenNums(list):
    numList = []
    for num in list:
        if num % 2 == 0:
            numList.append(num)
    return numList

print(evenNums([9, 2, 3, 4, 5, 6, 7, 8, 1]))

