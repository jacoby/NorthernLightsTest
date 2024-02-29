# Northern Light Programming Test

## The Challenge

> Please use a well-known programming language such as Perl, C++, Java, Python, or PHP to develop code that takes two input files. Both input files consist of lines sorted in lexicographically ascending order based on ASCII values. The code should produce two output files:
>
> * The first output file should contain lines that are present in the first input file but not in the second input file.
> * The second output file should contain lines that are present in the second input file but not in the first input file.

To create my sample files, I extracted words from `/home/jacoby/bin/dict.txt`, named **words1** and **words2**.

I do have a tendency to use existing solutions if possible, so I wrote **nl_list_compare.pl** using the [List::Compare](https://metacpan.org/pod/List::Compare) module.

But this is not a great demonstration of my programming ability, so I wrote it again as **nl_by_hand**, making a hash of both lists for fast comparison.

And, as this is for a Python position, I wrote **nl.py**.
