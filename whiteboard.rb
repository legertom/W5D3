## Question One

# Given the following table:

# ```ruby
# # == Schema Information
# #
# # Table name: nobels
# #
# #  yr          :integer
# #  subject     :string
# #  winner      :string

# ```

# Write the following SQL Query:

# 1.  In which years was the Physics prize awarded, but no Chemistry prize?


# SELECT yr 
# FROM nobels 
# WHERE yr IN (
#     SELECT yr 
#     FROM nobels 
#     WHERE subject != 'Chemistry'
# )
# AND subject = 'Physics'

# ```sql
# SELECT DISTINCT
#     yr
# FROM
#     nobels
# WHERE
#     (subject = 'Physics' AND yr NOT IN (
#     SELECT
#         yr
#     FROM
#         nobels
#     WHERE
#         subject = 'Chemistry'
#     ))


## Question Two: Reverse Characters

# Write a function that takes an array of characters and reverses the characters in place.
# Array will always have elements exactly 1 character in length
# Alpha characters only

# Example: ['h', 'e', 'l', 'l', 'o'] => ['o', 'l', 'l', 'e', 'h']

# Plan: Use each loop to mutate the original array and return it
#  Use the indicies to move the element to their new index
# 

# ['h', 'e', 'l', 'l', 'o']

# [o e l l h] i = 0
# [o l l e h] i = 1
# [o l l e h] i = 2

def reverse_in_place(array)

    i = 0
    while i <= array.length/2
        ele_1 = array[i]
        ele_2 = array[(i+1)*-1]
        array[i] = ele_2
        array[(i+1)*-1] = ele_1
        i+=1
    end
    array
end

arr = ['h', 'e', 'l', 'l', 'o']

p reverse_in_place(arr)