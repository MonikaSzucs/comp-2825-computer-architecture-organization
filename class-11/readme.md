# Class 11

## Question 1. 
How many bits make up the TAG, LINE, and WORD fields of the virtual address:
Memory: 1cell/word, 20-bit address, 4MB total memory
Cache: direct mapped,16 lines, 64 words in each line

TAG (Caches/memory)  LINE (lines/cache)   WORD (Words/line)


What are the TAG, LINE and WORD values (in binary) of main memory word 5A17(HEX) for the previous architecture?

answer:     0011 1001 0001 1011 1011
            0011100100  0110    111011
            TAG         LINE    WORD

## Question 2 
How many bits make up the TAG, LINE, and WORD fields of the virtual address:
Memory: 1 cell/word, each word is 32 bits in size, 24-bit address
Cache: direct mapped,1kB total cache, 8 bytes in each line

TAG (Caches/memory)  LINE (lines/cache)   WORD (Words/line)

What are the TAG, LINE and WORD values (in binary) of main memory word 123ABC(HEX) for the previous architecture?

Answer: 0001 0010 0011 1010 1011 1100
        0001001000111010    1011110 0
        TAG                 LINE    WORD

## Question 3
How many bits make up the TAG, LINE, and WORD fields of the virtual address:
Memory: 1 cell/word, each word is 8bytes in size, 2GB total memory
Cache: direct mapped, 128 words per line, 32 lines

TAG (Caches/memory)  LINE (lines/cache)   WORD (Words/line)

What are the TAG, LINE and WORD values (in binary) of main memory word 2468E2E(HEX) for the previous architecture?

Answer: 0010 0100 0110 1000 1110 0010 1110
        0010010001101000   11100  0101110
        TAG                 LINE   WORD

## Question 4
How many bits make up the TAG, LINE, and WORD fields of the virtual address:
Memory: 1 cell/word, 16 bit address, 2 bytes per word
Cache: direct mapped, 512 bytes total, 4 words per line

TAG (Caches/memory)  LINE (lines/cache)   WORD (Words/line)

What are the TAG, LINE and WORD values (in binary) of main memory word 30C2(HEX) for the previous architecture?

ANSWER  0011 0000 1100 0010
        00110000    110000  10
        TAG         LINE    WORD

## Question 5
How many bits make up the TAG, LINE, and WORD fields of the virtual address:
Memory: 1 cell/word, 256MB total memory, 25 bit address
Cache: direct mapped, 512 lines, 4 words per line

TAG (Caches/memory)  LINE (lines/cache)   WORD (Words/line)


## Question 6
How many bits make up the TAG, LINE, and WORD fields of the virtual address:
Memory: 1 cell/word, 1MB total memory, 2 bytes per word
Cache: direct mapped, 4kB, 64 bits in each line

TAG (Caches/memory)  LINE (lines/cache)   WORD (Words/line)



## Question 7

What are the TAG, LINE and WORD values (in binary) of main memory word 5A17(HEX) for the previous architecture?

Answer  0101 1010 0001 01111        T-L-W sizees 8-9-2
        000101101 0 0001011 11



## Question 8
A computer has a main memory which has one cell per word. It has a direct-mapped cache which holds 4 lines, each of which holds two words. A program is executed which reads data in three passes from a set of address sequences as shown below in base ten format: 

Pass 1: 40, 42, 44, 40, 41, 41, 42, 100, 2, 10 
Pass 2: 11, 12, 13, 11, 40, 41, 40, 100, 99, 101 
Pass 3: 42, 41, 40, 41, 42, 42, 43, 17, 100, 41 

Show the contents in tabular form of the cache at the end of each pass.


## Question 9
A computer has a main memory which has one cell per word. It has a direct-mapped cache which holds 4 lines, each of which holds four words. A program is executed which reads data in three passes from a set of address sequences as shown below in base ten format: 

Pass 1: 40, 42, 44, 40, 41, 41, 42, 100, 2, 10 
Pass 2: 11, 12, 13, 11, 40, 41, 40, 100, 99, 101 

Show the contents in tabular form of the cache at the end of each pass.

## Question 10
A computer has a main memory which has one cell per word. It has a direct-mapped cache which holds 2 lines, each of which holds 8 words. A program is executed which reads data in three passes from a set of address sequences as shown below in base ten format: 

Pass 1: 40, 42, 44, 40, 41, 41, 42, 100, 2, 10      hits so far: /10
Pass 2: 11, 12, 13, 11, 40, 41, 40, 100, 99, 101    hits this pass: /10

Show the contents in tabular form of the cache at the end of each pass. Calculate the hit rate for this example. Assume the cache is initially empty.

