#!/usr/bin/env python

from sys import argv
import os

def read_file (file):
    if os.path.exists(file):
        with open( file , "r") as f:
            words = f.read()
            f.closed
            return words

def write_file ( file, words ):
    with open(file, 'w') as file:
        file.write("\n".join(words))
    

def compare_wordlists( words1, words2 ):
    list1 = words1.splitlines()
    list2 = words2.splitlines()
    onlyleft = []
    onlyright = []
    for word in list1 + list2:
        if word in list1 and word not in list2:
            onlyleft.append(word)
        if word in list2 and word not in list1:
            onlyright.append(word)
    return (onlyleft, onlyright)
    
def main ():
    file1 = argv[1]
    file2 = argv[2]
    words1 = read_file( file1 )
    words2 = read_file( file2 )
    onlyleft, onlyright = compare_wordlists( words1, words2 )
    write_file("python_first_only", onlyleft)
    write_file("python_last_only", onlyright)

if __name__ == '__main__':
    main()