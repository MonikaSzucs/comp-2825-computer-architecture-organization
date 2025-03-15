# Class 10

- the next 2 lessons or so will deal with 
- logarithms
- bits
- bytes
- words
- cells
- lines
- sets
- blocks
- decimal
- binary
- hexadecimal

`Mandatory rules`
1. Show all your work
2. work in power of 2
3. always show the units
4. double check your work

We will be working out how the CPU requests words from main memory, but actually they are usually found in the cache.

## Questions
1. Convert 1234 (decimal) into binary and hex

binary: 
Step-by-Step Division by 2:

1234 ÷ 2 = 617 with a remainder of 0
617 ÷ 2 = 308 with a remainder of 1
308 ÷ 2 = 154 with a remainder of 0
154 ÷ 2 = 77 with a remainder of 0
77 ÷ 2 = 38 with a remainder of 1
38 ÷ 2 = 19 with a remainder of 0
19 ÷ 2 = 9 with a remainder of 1
9 ÷ 2 = 4 with a remainder of 1
4 ÷ 2 = 2 with a remainder of 0
2 ÷ 2 = 1 with a remainder of 0
1 ÷ 2 = 0 with a remainder of 1

Reading the remainders from bottom to top, the binary representation is:

1234 lower 10 = 10011010010 lower 2


Hex: 
Step-by-Step Division by 16:

1234 ÷ 16 = 77 with a remainder of 2
77 ÷ 16 = 4 with a remainder of 13 (which is D in hexadecimal)
4 ÷ 16 = 0 with a remainder of 4
Reading the remainders from bottom to top, the hexadecimal representation is:

1234 lower 10 = 4D2 lower16

2. A city has 400,000 people. There are 4 people in every house.
How many digits are necessary for a house address?
What are the lowest and highest house address?

Number of houses= People per house / Total population = 400,000 people/city divided by 4 people/house = 100,000 houses/city


Log10(100,000) = 5 because 10^5 = 100,000

00000 99999

3. Question
Main memory is divided into cells. 
Each cell is the same size (ex 1 byte)
Each cell has an address.
`IN THIS COURSE, we will always assume that each word is one cell.`

imagine a very small memory with 8 cells containing 1 byte each:
How many bute are needed to address this memory?

Log base 2 (8) = 3

Defintion of log is exponent ex
2^3 - 8
Log base 2 (8) = 3

|  |  |
| :--- | :--- | 
| 1 byte | 000 |  
| 1 byte | 001 | 
| 1 byte | 010 | 
| 1 byte | 011 | 
| 1 byte | 100 | 
| 1 byte | 101 | 
| 1 byte | 110 | 
| 1 byte | 111 | 

A computer has a 32-bit memory address. There is 1 byte of data in each cell.

How much total memory is there

2^32 addresses can be made using 32 bits
There is a total of 2^32 words /memory * 2^0 bytes/word = 2^32 bytes/memory - 4GB

4. 1 cell per word; 64 bits per word; 20-bit memory address 

How much total memory is there?

2^6bits / word divided by 2^3 bits/bytes = 2^3 bytes/word

2^20 addresses = 2^20 cells = 2^20 words/memory

2^20 words/memory divided by 2^3 bytes/word = 2^23 bytes/memory = 8MB

5. 16-bit main memory address; 2MB total memory; 1 word/cell; WORD SIZE?

1MB is 2^20 so 2MB 2^21

2^21 B (bytes) / Memory divided by 2^16words/memory = 2^5 bytes per word

6. 1kB total memory; 1 cell/word; 4 bytes/word; what are the first and last addresses?

2^10 Bytes/Memory divided by 2^2 Bytes/word = 2^8 Words/memory (256 words per memory)

first-last address = 0-255 (decimal); 
00000000-11111111 (binary);
OO to FF (HEX)

## Important
- no quiz next week

imagine a 32-word memory with one cell/word. How many bits do we need to address this memory?

log base 2(32) = 5


|  |  |
| :--- | :--- | 
| 00000 |  |  
| 00001 |  | 
| 00010 |  | 
| 00011 |  | 
| 00100 |  | 
| 00101 |  | 
| 00110 |  | 
| 00111 |  | 
| 01000 |  | 
| 01001 |  | 
| 01010 |  | 
| 01011 |  | 
| 01100 |  |
| 01101 |  |
| 01110 |  |
| 01111 |  | 
| 10000 |  | 
| 10001 |  | 
| 10010 |  | 
| 10011 |  | 
| 10100 |  | 
| 10101 |  |
| 10110 |  |
| 10111 |  |
| 11000 |  |    
| 11001 |  | 
| 11010 |  | 
| 11011 |  |
| 11100 |  |
| 11101 |  |
| 11110 |  |
| 11111 |  |   




