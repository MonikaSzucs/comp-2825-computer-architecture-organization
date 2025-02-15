# Quiz 1

1. In your own words, explain the difference between translation and interpretation.

Translation AKA Compliation
- Compilers do the conversion from the higher level language to the lower level language
- converting an entire high level language (HLL) program to an equivalent lower level language  program all at once. Then you no longer need the high level language program. Ex once you have the game you dont need the sourse code anymore because you got the .exe
- compliation is really slow. Once it is complied though it is fast.

Interpretation
- interpreting it as I go word by word
- cant get rid of your program
- converts a higher level language program into the equivalent lower level language program, one instruction at a time (convert one instruction, run it, repeat with the next instruction)
- can run it sooner but not the whole thing.

2. Consider a multilevel computer in which all the levels are different. Each level has instructions that are 9 times as powerful as those of the level below it; that is, one level y instruction can do the work of 9 level y − 1 instructions. If a level-four program requires two seconds to run, how long would equivalent programs take at levels two and ten, assuming r level y instructions are required to interpret a single y + 1 instruction? Always show your work. 

r = the level in question
T4 is the starting point of 2s

Equation Ty = T4 x (1/9) ^(4-y)

T4= the starting point at 2s
y = which level I want to go to.

Level 10: T10 = T4 x (1/9) ^(4-y) = 2 x (1/9) ^(4-10) = 2 x (1/9) ^-6  = 1,062,882 seconds
Level 4: T4 = 2s
Level 2: T2 = T4 x (1/9) ^(4-y) = 2 x (1/9) ^(4-2) = 2/81 = 0.0247 seconds

`Teacher fix`: 
power: 9
interpreter instructions needed to convert from 1 HLL to 9 LLL instructions: r

level ten: 2(r/9)^6 seconds
Level four: 2s
level two: 2(9/r)^2 seconds

3. Answer like we did in class: what is 2^34 divided by 2^15? Use the SI prefixes. Always show your work. 

2^34 / 2^15 =
a^m / a^n = a^(m-n)

2^(34-15) = 2^19

Notes:
2^5 = 32
2^10 = 1024 = 1K
2^9 = 512

So that means:
2^10 * 2^9 = 512K

4. What are three advantages and one disadvantage of having a six-level computer (as opposed to a one-level computer)? Explain clearly.

The three advantages of of having a six-level computer compared to one leve:
- there is modularity
- it is easier for us and the computer
- it is cheap to get hardware/programmers to fix a specific area (we only need to replace one of the levels and/or translators)

The one disadvantage:
- When you have so many levels it will make things go slower.