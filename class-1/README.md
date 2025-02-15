# Class 1

John Von Neumann
- talk about him
- your computer is the result of many companies: simpler, cheaper, backwards compatible

`Bit`: binary digit 0 or 1
`byte`: 8-bit word
`Word`: size: 64 bits probably; the size depends on the size of a register
`Register`: fast cpu memory; by definition it stores a single word (an instruction, an address, an operand)
- 32 bit vs 64 bit: 2^64 = 2^32 * 2^32
`cpu`: central processing unit; FDE (Fetch-decode-execute) cycle - fetches, decodes, and executes instructions
`RAM`: Random access memory; main memory; 
`Bus`: a common electrical pathway along which data moves between devices

2^5 = 32
2^10 = 1024 = 1k
2^15 = 2^5 * 2^10 = 32k
2^20 = 1M
2^30 = 1G
2^40 = 1T

2^37 = 2^7 G = 128G
2^49 = 512T

Example
imagine a hello World C program: 170bytes   level 5 program
the .exe file was 16kb                      level 0 program


Level 5
- easier for humans
- harder for computers
- programs get smaller
Level 0
- easier for computers
- harder for humans
- program gets larger

- The same program we write at level 5, gets translated and interpreted into a total of 6 programs that do that same thing (but in different languages)


- Compiling is a very slow process

----
Level 10
- talk to your computer and it makes a video game and it makes it by itself
Level 7
- chatgpt
Level 6 
- would be even easier for people
- even harder for computers
- even slower than level 5
- ex english
Level 5
- c programs
- mySQL_remote_conntect()
- fewer of them and less code
- less instructions
- smaller program
- most powerful
- easier for humans
- harder for computers
Level 4
Level 3
Level 2
Level 1
Level 0
- usually like a .exe (executable)
- only program that actually runs  **
- programm gets bigger
- the most instruction needed
- least powerful
- this level is better
- harder for humans
- easier for computers


---
I'm speaking to someone who speaks:

French 
Fr-Gr (translators/interpretors/converters)
German 
Gr-Ic
Icelandic 
Ic-Sp
Spanish 
Sp - Jp
Japanese
Jp - En
English

- 6 levels (ie 6 languages)
- 5 interfaces between them (aka interpreters and translators)
- if we change icelandic to Finnish what else must changes?
- the two translators must change

## Quiz questions
if we change an operating system what else needs to change?
- the translation assembler and partial interpreation
- this means it has VERY GOOD MODULARITY
- benefit of having many levels is that we have good `modulatirity` and its easy for us, the computer and its `cheap` hardware/programmers. We only need to replace one of the levels

CHEAP
- cheap hardware
- cheap programmers

if its only one level?
- it will be amazing for us but hard for computer or it will be really easy for the computer but hard for us
- not modular
- no translation

---

`Translation AKA Compliation `
- Compilers do the conversion from the higher level language to the lower level language
- converting an entire high level language (HLL) program to an equivalent lower level language  program all at once. Then you no longer need the high level language program. Ex once you have the game you dont need the sourse code anymore because you got the .exe
- compliation is really slow. Once it is complied though it is fast.

`Interpretation`
- interpreting it as I go word by word
- cant get rid of your program
- converts a higher level language program into the equivalent lower level language program, one instruction at a time (convert one instruction, run it, repeat with the next instruction)
- can run it sooner but not the whole thing.

--
## Problem with modularity
- As you keep adding more levels it will make things more slower/less speed. It will make it more modular as you add more levels.
- the more instructions that are below the more powerful the level above 

## Which is more powerful

`Lower-level languages` can be considered more powerful in scenarios where you need maximum control over hardware, performance, and efficiency. They give you the ability to write highly optimized, fine-tuned code for specialized hardware.

`Higher-level languages` are generally more powerful in terms of developer productivity, portability, and ease of use. While they may not give you as much control over hardware, they let you solve problems faster and more abstractly, which is often more valuable for many modern applications.

It depends on what you mean by "power":

`Hardware/Computational Control:` The digital logic level (Level 0) is more "powerful" because it gives you complete control over computation and is the foundation for all computing. Every program you write in a high-level language eventually compiles down to machine instructions that run on this level.

`Ease of Problem Solving and Productivity`: The higher-level languages (Level 5) are more "powerful" in the sense that they allow you to rapidly create complex applications and solve problems without needing to manage the intricacies of hardware or machine code.

The other technique is to write a program in L0 that takes programs in L1 as
input data and carries them out by examining each instruction in turn and executing
the equivalent sequence of L0 instructions directly. This technique does not require first generating a new program in L0. It is called `interpretation` and the program that carries it out is called an `interpreter`

---

Video 1:50:00 explanation
Lesson 1
--

Page 52 in textbook
4. consider a multilevel computer in which all the levels are different. Each level has instructions that are m times as powerful as those  for the level below it; that is, one level r k seconds to run, how long would equivalent programs take at levels 2,3 and 4 assuming n level r instructions are required to interpret a single r + 1 instruction?

Clearly define the variables: r, k, m, n

doesn't matter which level you put r at

as you go up in level it does  k * (n/m)
r = the level in question
k = time in seconds for the program to run at level 1
m = the number of lower level language instructions required to do the same work as one higher level instruction
n the number of interpreter instructions required to transform each Highlevel language instruction (into the equivalent set of lower level instructions)

Let m = 3
Let n = 4

n > m which means n must be greater than m
- it took 4 interpretations - required to transform from higher to lower level 

- the larger m is then then it gets smaller at the top
- A larger value of m is good because the program will be faster because `there are fewer instructions to be CONVERTED (interpreted)`
- if i had stronger people when moving i would need fewer people and it will go faster. It would be better to buy lunch for the 5 strong people then 30 CST students.


Level 4                       m
                    ////    ||||    \\\\
Leve 3               m        m       m
            //// |||| \\\\
Level 2      m     m    m   mmm mmm

Leve 1    mmm mmm mmm mmm mmm mmm mmm mmm mmm

if `m` is bigger and bigger what happens to the overall time and why?
The time goes down because there are fewer instructions to be converted

if `n` is bigger and bigger what happens to the overall time and why?
The time goes up because 
the number of required conversions is higher

`Answer`:
level 4
k (n/m)^3
level 3:
k (n/m)^2
level 2: 
- takes longer because level 2 must first be converted into level 1 then is run
 k(n/m) seconds
level 1 
- takes k seconds


* The bigger m is the smaller the time is.
* the bigger n is the bigger the time is.