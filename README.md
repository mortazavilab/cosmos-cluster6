# TA Github Repository for COSMOS Cluster 6, 2023
Contains R and Python Jupyter notebooks to walk you through various bioinformatics exercises.

# Intro to Python, pandas, and iPython notebooks
## iPython notebooks
Welcome to jupyter notebook on HPC (high-performance compute cluster). iPython notebooks / jupyter notebooks are interactive multimedia environments to write and run code.

Here is the link: [https://hpc3.rcic.uci.edu/biojhub3/](https://hpc3.rcic.uci.edu/biojhub3/). Please choose the "containerized notebook image" named "Centos7 Base Jupyter w/R4.1.2 + COSMOS 2023".

For those who have programmed and run their own programs before, perhaps you're more familiar with running your program once from start to end. iPython notebooks provide a way to run code more interactively.

Each unit in a jupyter notebook is called a cell. Typically when I use ipynbs, I run one cell at a time. You can run a cell by clicking on it and pressing shift+enter.

Copy this code into a cell and try running it:
```python
print('hello world')
```

Another really nice feature of ipynbs that is particularly well-suited for data science is the persistence of variables after running a cell of code. That is to say, if you run some code in one cell, you can then access it in another cell and investigate what it is. This allows you to run small chunks of code at a time, make sure that they're doing what you want them to, and then to continue using your variables.

Take the following example, say we have a list and we want to swap out all instances of 'dog' for 'cat'

```python
pet_list = ['dog', 'cat', 'guinea_pig', 'lizard', 'cat', 'dog', 'mouse']
```

First, we can see if we can identify which parts of the list contain 'dog' instances.

```python
# loop through the list and find the indices of the list where the element is 'dog'
dog_indices = []
for i, element in enumerate(pet_list):
    if element == 'dog':
        dog_indices.append(i)
```


# Cloning this Github repository
1. Log on to HPC using Terminal (Mac) or MobaXterm (Windows). See [TA slides](https://docs.google.com/presentation/d/1XkhM_1Z9dsAPPeg31nrXUsKbAKWJ-iHeLLOzTKuuAdw/edit#slide=id.g257914d541e_0_174) for a walkthrough, and message us on the Slack [help channel](https://cosmoscluster62023.slack.com/archives/C05FS0M03PH) for help!
2. Run the following line: 
```bash
git clone https://github.com/erebboah/ta-github.git
```
3. Type `ls` to list the contents of your home directory on HPC. You should see a new directory called “ta-github”
4. Refresh your jupyter file browser to also see "ta-github". You can navigate into the directory and explore the other notebooks and data using HPC's jupyter environment.
