# Class 11

Virtual Address 
Tag-Line-word
00  01   0
2-2-1

- 5 bit address is determined by the cache with 2-2-1
- 5 bits total width is the memory which is 00010

How many bits on a 20 bit address? its 20 bits

## Question 1. 
How many bits make up the TAG, LINE, and WORD fields of the virtual address:
Memory: 1 cell/word, 20-bit address, 4MB total memory
Cache: direct mapped, 16 lines, 64 words in each line

TAG (Caches/memory)     LINE (lines/cache)      WORD (Words/line)
20-4-6=10 bits          Log(base2)16 = 4bits    Log(base2)64 = 6 bits
Entire address is 20 bits

Double check tag size
To get directly log(base2)(total memory/total cache)
2^20 addresses/memory = 2^20 cells/memory = 2^20 words/memory
2^4 lines/cache * 2^6 words/line = 2^10 words/cache
2^20 words/memory divided by 2^10 words/cache = 2^10 caches memory

What are the TAG, LINE and WORD values (in binary) of main memory word 391BB(HEX) for the previous architecture?

answer:     0011 1001 0001 1011 1011
            0011100100  0110    111011
            TAG         LINE    WORD

## Question 2 
How many bits make up the TAG, LINE, and WORD fields of the virtual address:
Memory: 1 cell/word, each word is 32 bits in size, 24-bit address
Cache: direct mapped, 1kB total cache, 8 bytes in each line

TAG (Caches/memory)     LINE (lines/cache)      WORD (Words/line)
16 bits                 24-16-1=7bits           1bit
Entire address is 24 bits

1kB = 1024 bytes = 2^10 bytes
8 bytes = 2^3 bytes
total cache size/bytes per line 2^10 divided by 2^3 = 2^7 = 128 lines

2^5 bits/word divided by 2^3 bits/byte = 2^2 bytes/word
2^3 bytes/line divided by 2^2 bytes/word = 2^1 words/line

TAG size
Log(base2)(total memory/total cache)
2^24 words/memory * 2^2 bytes/word = 2^26 bytes/memory divided by 2^10 bytes/cache = 2^16 cache/memory

Are there really 2^7 lines/cache?
2^10 bytes/cache divided by 2^3 bytes/line = 2^7 lines/cache; yes the line field is 7 bits

What are the TAG, LINE and WORD values (in binary) of main memory word 123ABC(HEX) for the previous architecture?

Answer: 0001 0010 0011 1010 1011 1100
        0001001000111010    1011110 0
        TAG                 LINE    WORD

## Question 3
How many bits make up the TAG, LINE, and WORD fields of the virtual address:
Memory: 1 cell/word, each word is 8bytes in size, 2GB total memory
Cache: direct mapped, 128 words per line, 32 lines

TAG (Caches/memory)     LINE (lines/cache)      WORD (Words/line)
28-5-7=16 bits          Log(base2)32 = 5bits    Log(base2)128 = 7bits
The entire address is 28 bits

How long is the entire address?
2GB = 2^31 bytes/memory
2^31 bytes/memory divided by 2^3 bytes/word = 2^28 words/memory (ie 28 bit address)
total cache: 2^7 words/line * 2^5 lines/cache = 2^12 words/cache
2^12 words/cache * 2^3 bytes/word = 2^15 bytes/cache

TAG size
log(base2)(total memory/total cache)
2^31 bytes/memory divided by 2^15 bytes/cache = 2^16 caches per memory
take the log its a 16 bit TAG field

What are the TAG, LINE and WORD values (in binary) of main memory word 2468E2E(HEX) for the previous architecture?

Answer: 0010 0100 0110 1000 1110 0010 1110
        0010010001101000   11100  0101110
        TAG                 LINE   WORD

## Question 4
How many bits make up the TAG, LINE, and WORD fields of the virtual address:
Memory: 1 cell/word, 16 bit address, 2 bytes per word
Cache: direct mapped, 512 bytes total, 4 words per line

TAG (Caches/memory)     LINE (lines/cache)      WORD (Words/line)
16-6-2=8 bits           6 bits                  log(base2)4 = 2 bits
The address is 16 bits

4 = 2^2 words/line
2^2 words/line * 2^1 bytes/word = 2^3 bytes/line

2^9 bytes/cache divided by 2^3 bytes/line = 2^6 lines/cache this means 6 bit line field size

Lets verify, is the TAG really 8 bits?
Tag size
log(base2)(total memory/total cache)
2^16 words/memory * 2^1 bytes/word = 2^17 bytes/memory divided by 2^9 bytes/cache = 2^8 caches/memory
(which means an 8 bit TAG field size)

What are the TAG, LINE and WORD values (in binary) of main memory word 30C2(HEX) for the previous architecture?

ANSWER  0011 0000 1100 0010
        00110000    110000  10
        TAG         LINE    WORD

## Question 5
How many bits make up the TAG, LINE, and WORD fields of the virtual address:
Memory: 1 cell/word, 256MB total memory, 25 bit address
Cache: direct mapped, 512 lines, 4 words per line

TAG (Caches/memory)     LINE (lines/cache)                      WORD (Words/line)
14bits                  log(base2)512 = 2^9 lines = 2^9 bits    log(base2)4 = 2bits

The entire address is 25 bits

total memory 2^25 words/memory
total cache: 2^9 lines/cache * 2^2 words/line = 2^11 words/cache

TAG size 
log(base2)(2^25 words/memory divided by 2^11 words/cache) = 2^14 caches/memory

double check: 14bits + 9bits + 2bits must equal 25 bits; it does it seems correct.


## Question 6
How many bits make up the TAG, LINE, and WORD fields of the virtual address:
Memory: 1 cell/word, 1MB total memory, 2 bytes per word
Cache: direct mapped, 4kB, 64 bits in each line

TAG (Caches/memory)     LINE (lines/cache)      WORD (Words/line)
8bits                   9 bits                  2 bits
the entire address is 19 bits

TAG size
log(base 2)(total memory/total cache) = 2^20 bytes/memory divided by 2^12 bytes/cache
8 caches/memory giving a 8 bit TAG size

2^20 bytes/memory divided by 2^1 bytes/word = 2^19 words/memory
2^6 bits/line divided by 2^3 bits/byte = 2^3 bytes/line
2^12 bytes/cache divded by 2^3 bytes/line = 2^9 line/cache: 9 bit line field
2^3 bytes/line divided by 2^1 bytes/words = 2^2 words/line

8 + 9 + 2 = 19bits

What are the TAG, LINE and WORD values (in binary) of main memory word 5A17(HEX) for the previous architecture?

Answer  0101 1010 0001 01111        T-L-W sizees 8-9-2
        00010110 100001011 11



## Question 8
A computer has a main memory which has one cell per word. It has a direct-mapped cache which holds `4 lines`, each of which holds two words. A program is executed which reads data in three passes from a set of address sequences as shown below in base ten format: 

- Pass 1: 40, 42, 44, `40`, `41`, `41`, `42`, 100, 2, 10 
- Pass 2: `11`, 12, `13`, `11`, `40`, `41`, `40`, 100, 99, `101 `
- Pass 3: 42, `41`, `40`, `41`, `42`, `42`, `43`, 17, `100`, 41 

10 + 10 + 10 = `30 requests`

Show the contents in tabular form of the cache at the end of each pass.

REMEMBER:
the cache determines ho wmany words are in a line
memory pretends it is broken up into "blocks" of cells (the same number of words that are in a line)

It is the memory block (the word + its neighbors) that is mapped directly a line in cache

Show the content in tabular form of the cache at the end of each pass. Calculate the hit rate for this example. Assume the cache is initially empty.

|  |  |  |  |
| :---    |      :---:       |  :---:  |  :---:  |
| Line 00 | 40-41            |  40-41  |  <del>40-41</del> <br> <del>16-17</del> <br> 40-41  |
| Line 01 | <del>42-43</del> <br> <del>2-3</del> <br> 10-11 |  <del>10-11</del> <br> 98-99  | <del>98-99</del> <br> 42-43  |
| Line 10 | <del>44-45</del> <br> 100-101 | <del>100-101</del> <br> <del>12-13</del> <br> 100-101 | 100-101 |
| Line 11 |  |  |  |
|  | Pass 1 | Pass 2 | Pass 3 |

- this is bad because the last line of cache is empty but the other blocks of memory are fighting for the same line

> Hit rate `18/30` a bit means the word was IN the cache

> starts at line 0
- MM Block 0 contains cell 0-1 indirectly mapped into cache line 0
- MM block 1 contains cells 2-3 // line 1
- MM block 2 contains cells 4-5 // line 2
- MM block 3 contains cells 6-7 // line 3
- MM block 4 contains cells 8-9 // line 0
- MM block 5 contains cells 10-11 // line 1
- MM block 8 contains cells 16-17 // line 0 (16%4)
- MM block 20 contains cells 40-41 // line 0 (20%4)
- MM block 50 contains cells 100-101 // line 2 (50%4)

> notes:
- The cache determines how many words are in a line
- Memory pretends its broken up into blocks of cells (the same number of words that are in a line)
- It is the MEMORY BLOCK (the word + its neighbors) that is mapped directly a line in cache
- its called `thrashing` when they are hitting each other

## Question 9
A computer has a main memory which has one cell per word. It has a direct-mapped cache which holds 4 lines, each of which holds four words. A program is executed which reads data in three passes from a set of address sequences as shown below in base ten format: 
- Pass 1: 40, `42`, 44, `40`, `41`, `41`, `42`, 100, 2, 10 
- Pass 2: `11`, 12, `13`, `11`, 40, `41`, `40`, `100`, 99, `101` 

10 + 10 = `20 hit rate`

Show the contents in tabular form of the cache at the end of each pass.

|  |  |  |
| :---    | :---: |  :---:  | 
| Line 00 | 0-3   |  <del>0-3</del> <br> 96-99  | 
| Line 01 | 100-103   |  100-103  | 
| Line 10 | <del>40-43</del> <br> 8-11   |  <del>8-11</del> <br> 40-43  | 
| Line 11 | 44-47   |  <del>44-47</del> <br> 12-15  | 
|  | Pass 1   |  Pass 2  | 

Hit rate: `5+7/20`

MM block 0 contains cells 0-3 indirectly mapped into cache line 0
MM block 1 contains cells 4-7 // line 1
MM block 2 contains cells 8-11 // line 2
MM block 3 contains cells 12-15 // line 3
MM block 4 contains cells 16-19 // line 0
MM block 5 contains cells 20-23 // line 1

MM block 10 contains cells 40-43 // line 2 (10%4)
MM block 11 contains cells 44-47 // line 1 (25%4)
MM block 25 contains cells 100-103 // line 1 (25%4)

## Question 10
A computer has a main memory which has one cell per word. It has a direct-mapped cache which holds `2 lines`, each of which holds `8 words`. A program is executed which reads data in three passes from a set of address sequences as shown below in base ten format: 

Show the contents in tabular form of the cache at the end of each pass calculate the hit rate for this example

- Pass 1: 40, `42`, `44`, `40`, `41`, `41`, `42`, 100, 2, 10  
> hits 6/10 
- Pass 2: `11`, `12`, `13`, `11`, 40, `41`, `40`, 100, `99`, `101`
> hits 8/10

>Total hit rate 14/20

|  |  |  |
| :---    | :---: |  :---:  | 
| Line 0 | <del>40-47</del> <br> <del>96-103</del> <br> 0-7 |  <del>0-7</del> <br> <del>40-47</del> <br> 96-103  | 
| Line 1 |  8-15  |  8-15  | 
|  | Pass 1   |  Pass 2  | 

MM block 0 contains cells 0-7 // is indirectly mapped into cache line 0
MM block 1 contains cells 8-15 // line 1
MM block 2 contains cells 16-23 // line 0
MM block 3 contains cells 24-31 // line 1

MM block 12 contains cells 96-103 // line 0 (12%2)

