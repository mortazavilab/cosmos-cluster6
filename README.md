# TA Github Repository for COSMOS Cluster 6
Contains Python Jupyter notebooks to walk you through various bioinformatics exercises.

# Intro to Python, pandas, and iPython notebooks
## iPython notebooks
Welcome to Jupyter notebook on HPC (high-performance compute cluster). iPython notebooks / Jupyter notebooks are interactive multimedia environments to write and run code.

Here is the link: [https://hpc3.rcic.uci.edu/biojhub4/](https://hpc3.rcic.uci.edu/biojhub4/). Please choose the "containerized notebook image" named **[Centos7] COSMOS Cluster 6**.

For those who have programmed and run their own programs before, perhaps you're more familiar with running your program once from start to end. iPython notebooks provide a way to run code more interactively.

Each unit in a Jupyter notebook is called a cell. Typically when we use ipynbs, we run one cell at a time. You can run a cell by clicking on it and pressing shift+enter.

Copy this code into a cell and try running it:
```python
print('hello world')
```

Another feature of ipynbs that is particularly well-suited for data science is the **persistence of variables** after running a cell of code. That is to say, if you run some code in one cell, you can then access it in another cell and investigate what it is. This allows you to run small chunks of code at a time, make sure that they're doing what you want them to, and then continue using your variables.

Take the following example, say we have variables a and b and want to perform some basic arithmetic operations:

```python
a = 10
b = 5
sum_ab = a + b
diff_ab = a - b
product_ab = a * b
div_ab = a / b

print(sum_ab)
print(diff_ab)
print(product_ab)
print(div_ab)
```

The assignments of a and b persist across the operations. If we change `a = 5`, can you predict the following outputs?

```python
a = 5
sum_ab = a + b
diff_ab = a - b
product_ab = a * b
div_ab = a / b

print(sum_ab)
print(diff_ab)
print(product_ab)
print(div_ab)
```

Notice that the variables `sum_ab`, `diff_ab`, `product_ab`, and `div_ab` have all been updated to reflect the new `a`. It's important to be mindful of the variables you use within a single session! When in doubt, make a new variable to store results.


First, we can see if we can identify which parts of the list contain 'dog' instances.

```python
pet_list == 'dog'
```

```python
# make sure that each of the indices we found are 'dog'
for i in dog_indices:
    print(pet_list[i])
    print(pet_list[i] == 'dog')
```

```python
# now that we can be confident that we've identified all the elements of the list that are 'dog', we can replace them
for i in dog_indices:
    pet_list[i] = 'cat'
```

```python
# and finally, verify that all of the elements of the list have been replaced
print(pet_list)
print('dog' in pet_list)
```

This is a pretty simple example, but hopefully it demonstrates the value of being able to stop and examine what your code is doing while you're writing it, instead of debugging it by running everything over again every single time. This convenience shines when you're dealing with big data and don't have to bother loading it / transforming it (which can be very time consuming steps) every time you want to try something new.

An additional nice functionality of ipynbs is their direct compatibility with Markdown, which is actually what this tutorial is written in. For each cell in a Jupyter notebook that you write, you can choose whether it should be interpreted as code, Markdown, or raw text. Markdown supports text *formatting* such as **this**. You can also make headings in Markdown for different sections of your Jupyter notebook, which you can see in the other parts of this tutorial.

## Python

When you created your Jupyter Notebook, you choose a specific kernel that corresponds to the programming language you want to use. The kernel acts as an intermediary between the user interface (Jupyter) and the programming language used in the notebook (e.g., Python, R, etc.) Python is a programming language that is commonly used in bioinformatics. It is easy to understand and write, and has powerful libraries that you can load for data science and visualization.

```python
# import is like library() in R. by using the "as" keyword you can give imports different variable names

import pandas as pd # library for data matrix manipulation
import seaborn as sns # library for plotting pandas-formatted data
# by the way, lines that start with '#' are called comments
# add them to your code to remember what you were doing
```

```python
# types of variables (simple)
my_int = 1 # whole numbers are 'ints' (integers)
print(my_int)
print(type(my_int))
print()

my_float = 0.003 # numbers with decimal places are 'floats' and have higher precision than ints
print(my_float)
print(type(my_float))
print()

my_string = 'hello world' # text enclosed in either '' or "" are 'strings'
print(my_string)
print(type(my_string))
print()
```


```python
my_list = ['frog', 'bat', 'axlotl'] # list
print(my_list[0]) # indexing a list (python is a 0-based language)
print(my_list[1])
print(my_list[2])
print(type(my_list))
```


```python
my_dict = {'axlotl': 'amphibian', 'bat': 'mammal', 'frog': 'amphibian'} # dictionary - store key:value pairs
print(my_dict['axlotl'])
print(my_dict['bat'])
print(my_dict['frog'])
print(type(my_dict))
```


```python
data = ['amphibian', 'mammal', 'amphibian']
ind = ['axlotl', 'bat', 'frog']
df = pd.DataFrame(data=data, index=ind, columns=['kind']) # pandas data frame - I work with these every day!
print(df)
print(type(df))
```


```python
# The concept of a function vs. a method is difficult for Python beginners
print() # is an example of a built-in function. 

# we can also define our own function with this basic syntax:
# def functionName( arg1, arg2,….):
#   …….
#   # Function_body
#   ……..
def sum(num1, num2):
   return (num1 + num2)
sum(5,6) # now sum() is an example of a user-defined function

# In contrast, a method is associated with an object. 
# EVERYthing in python is an "object", including libraries like pandas
# syntax:
# class ClassName:
#   def method_name():
#      …………..
#      # Method_body
#      ………………

class Pet(object):
   def my_method(self):
      print("I am a Cat")
cat = Pet()
cat.my_method() # call custom method named my_method 
```

```python
# objects can also have attributes based on what it is
# for example say we have a string
a = "hello"
print(a)
```


```python
# press tab to see the attributes for a string. a.<Press tab>
print(a.capitalize())
print(a.upper())
```


```python
# for loops

# iterate until a certain number
for i in range(10):
    print(i)
    
print() # space

# iterate through a list
my_list = ['frog', 'bat', 'axlotl'] # list
for animal in my_list:
    print(animal)
    
print()
    
# iterate through a list while getting the number of each iteration using enumerate()
for i, animal in enumerate(my_list):
    print('Animal at {}: {}'.format(i, animal)) # string formatting - this is also useful
```


```python
# if / else blocks - execute code based on whether or not a condition is met
for animal in my_list:
    if animal == 'frog' or animal == 'axlotl': # or logic - one or the other condition is met
        print('Animal {} is an amphibian'.format(animal))
    else:
        print('Animal {} is not an amphibian'.format(animal))
        
print()

first_element = True # boolean variable, can be True or False
for animal in my_list:
    if first_element and animal == 'frog': # and logic - both conditions must be true
        print('First animal is frog')
    elif first_element and animal == 'bat': # elif: the following will execute only if the first part does not. in this case, it will never run.
        print('First animal is bat')
    else:
        # you can index strings the same way you can index lists. here we're just trying to see if the word
        # starts with a vowel
        if animal[0] == 'a' or animal[0] == 'e' or animal[0] == 'i' or animal[0] == 'o' or animal[0] == 'u': 
            print('Found an {}'.format(animal))
        else:
            print('Fount a {}'.format(animal))
    
    first_element = False
```


```python
# while loops - execute code until a condition is met
# useful when you're not sure when something's going to be done ie you don't know the exact index
my_list = ['cat', 'bat', 'planarian', 'frog', 'axlotl']
i = 0
while my_list[i] != 'frog' and my_list[i] != 'axlotl': # inequality, check if something is not equal to something else
    i += 1 # += operator, increment by 1
print('First amphibian ({}) occurs at index {}'.format(my_list[i], i))
```


```python
# list indexing / slicing

# access individual elements using individual numbers 
# 0 is first element, -1 is last element, -2 is second from last element
print(my_list[0])
print(my_list[-1])
print(my_list[-2])

print()

# slice list using the : operator
print(my_list[:-1]) # all elements of the list but the last one
print(my_list[1:]) # all elements of the list by the first one
print(my_list[2:4]) # some middle elements of the list
```


```python
# list comprehension - python provides a compact way to iterate through lists
# this is a little tricky so I don't entirely recommend if if you aren't solid
# on other programming concepts

# say we want to make a list from this dictionary that includes both 
# the animal and the type of animal it is in the format "axlotl_amphibian"
my_dict = {'axlotl': 'amphibian', 'bat': 'mammal', 'frog': 'amphibian'} 

# original for loop 
new_list = []
for key, item in my_dict.items(): # this is how you iterate through key:item pairs in a dictionary btw
    new_list.append(key+'_'+item) # this is how you add an element to a list and how you concatenate strings together
print(new_list)

print()

# list comprehension
new_list = [key+'_'+item for key, item in my_dict.items()]
print(new_list)
```


```python
# list comprehension with if / else
# you can use if / else logic in list comprehension as well 

# say we want to make a list of True and False values to say
# whether or not each animal in a list is an amphibian
my_list = ['frog', 'bat', 'axlotl']

# original for loop
new_list = []
for animal in my_list:
    if animal == 'frog' or animal == 'axlotl':
        new_list.append(True)
    else:
        new_list.append(False)
print(new_list)

print()

# list comprehension
new_list = [True if animal == 'frog' or animal == 'axlotl' else False for animal in my_list]
print(new_list)
```

```python
# list comprehension with if 
# this is a little different for whatever reason

# say we want to get a list of animals that are amphibians from our list
my_list = ['frog', 'bat', 'axlotl']

# original for loop
new_list = []
for animal in my_list:
    if animal == 'frog' or animal == 'axlotl':
        new_list.append(animal)
print(new_list)

print()

# list comprehension
new_list = [animal for animal in my_list if animal == 'frog' or animal == 'axlotl']
print(new_list)
```

## Pandas
Pandas is a really powerful library for data matrix manipulation. I'll go over some common uses of it here.

Big data manipulation is pretty tricky and the language that is used in the field is specific and difficult to master for Googling. If you feel like you're trying to do something with a matrix that feels like there's got to be a better way to do it, you're probably right and we can help you investigate.

```python
# create a dataframe
data = ['amphibian', 'mammal', 'amphibian']
ind = ['axlotl', 'bat', 'frog']
df = pd.DataFrame(data=data, index=ind, columns=['kind'])
df.index.name = 'animal'
df
```

```python
# write a dataframe to a tsv file
df.to_csv('animals.tsv', sep='\t')
```

```python
# read in a dataframe from a tsv file
df = pd.read_csv('animals.tsv', sep='\t') # https://pandas.pydata.org/docs/reference/api/pandas.read_csv.html
df.head() # use df.head() to look at what's in the beginning of the dataframe
```

```python
# use groupby to count the number occurrences of the different kinds 
temp = df.groupby('kind').count().reset_index()
temp.rename({'animal': 'counts'}, axis=1, inplace=True)
temp
```

```python
# you can use pandas to perform different groupby operations as well 
# for instance, say we have a column to represent how many animals 
# a person has
df['fairlie'] = [3,0,70]
df['liz'] = [0,4,0]
df['jaz'] = [10,2,3]
df['ali'] = [25,6,2]
print(df.head())

print()

temp = df.groupby('kind').sum().reset_index() 
print(temp.head())
```

```python
# transpose
print(df.head())

temp = df.transpose()

print()

print(temp.head())
```

```python
# access elements in the df using conditions
temp = df.loc[df.kind == 'amphibian'] # only amphibians
print(temp.head())
```

```python
# transpose
print(df.head())

temp = df.transpose()

print()

print(temp.head())
```

```python
# access elements in the df using conditions
temp = df.loc[df.kind == 'amphibian'] # only amphibians
print(temp.head())
```

```python
# access elements in the df using more than one condition (using and logic)

# only amphibians that are also frogs (this is a bad example but I promise it will extend to more complex situations)
temp = df.loc[(df.kind == 'amphibian')&(df.animal == 'frog')]
print(temp.head())
```

```python
# perform database-style merges 
# there are a lot of options so please look at the documentation for more info!
# https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.merge.html
data = [['frog', 0, 10], ['axlotl', 0, 20]]
# data = [['frog', 'axlotl'], [0,0], [10,20]]

columns = ['animal_new', 'ali', 'kyoko']
new_df = pd.DataFrame(data=data, columns=columns)
print(new_df)
print(df)
print()

# merge new animal ownership info with old 
temp = df.merge(new_df, how='outer', left_on='animal', right_on='animal_new')
print(temp)

print()

# fill NaN (not a number) values with 0s and replacce the missing animal_new values
temp['animal_new'] = temp['animal']
temp.fillna(0, inplace=True)
print(temp)
```

```python
# melt
# sometimes you need to convert the format from wide format, where each row has multiple data entries.
# (in this case, each entry corresponds to the number of animals each person has),
# into long format, where each row represents one entry
# i commonly use melt to coerce the data into a format that is compatible with
# plotting tools I want to use
# for me at least, the options are a little confusing but just play with it until 
# it does what you want
# https://pandas.pydata.org/docs/reference/api/pandas.melt.html

print(df)
print()

temp = df.melt(id_vars=['animal', 'kind'], value_vars=['fairlie', 'liz', 'jaz', 'ali'], 
               var_name='person', value_name='counts')
print(temp)
```

```python
# pivot
# pivot is the opposite of melt. turn a long-form data matrix into a wide-form one

print(temp)
print()

temp = temp.pivot(['animal', 'kind'], columns='person', values='counts')
print(temp)
```

```python
# perform mathematical operations on your dataframe
# pandas can perform many math operations on elements of your dataframe in parallel (so it's really efficient)

# create a new column that's the sum of the animals that liz and fairlie have
df['5th_years'] = df['fairlie']+df['liz']
print(df)
```

```python
# you can also perform operations that involve constants that 
# are not columns in the dataframe

# create a new column that multiplies jaz's animals by 10
df['jaz_x10'] = df['jaz']*10
print(df)
```

```python
# what if we want to determine what percent of ali's total collection
# of animals that each individual animal comprises?

# use the sum function to compute the total number of
# animals that ali has
ali_total = df['ali'].sum()
print(ali_total)
print()

# create a new column that computes percent of 
# total animals that each animal ali has comprises
df['ali_percent'] = (df['ali']/ali_total)*100
print(df)
```

```python
# unique values - get the unique values present in a column of a dataframe

print(df['kind'].tolist())

print(df['kind'].unique().tolist())
```

# Cloning this Github repository
1. Log on to HPC using Terminal (Mac) or MobaXterm (Windows). See [TA slides](https://drive.google.com/drive/folders/1FkgLq5Qowr-aKBtwesRVfjq0DYgpOuAx) for a walkthrough, and message us on Slack for help!
2. Run the following line: 
```bash
git clone https://github.com/mortazavilab/cosmos-cluster6.git 
```
3. Type `ls` to list the contents of your home directory on HPC. You should see a new directory called “cosmos-cluster6”
4. Refresh your Jupyter file browser to also see "cosmos-cluster6". You can navigate into the directory and explore the other notebooks and data using HPC's Jupyter environment.
