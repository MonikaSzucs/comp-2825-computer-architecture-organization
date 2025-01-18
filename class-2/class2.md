# class 2

## Definitions
`clock` - anything that can be turned on and off
`clock cycle`   - ex 100MHz bus frequency: 100 million cycles per second;
                100 * 10^6
                - Period = 1/frequency; 1/1M = 1 microsecond = 10^-6
                when we talk about clock sits power of 10
                1GHz = 1000000000 cycles/second; corresponds to 1/1000000000th second/cycle (1ns)

1GHz cpu    - 1 billion rising and falling edges per second
            - 1 rising edge per nanosecond
            - POSSIBLE we could `start` one instruction each nanosecond

The clock cycle of cable TV shows is 30 minutes: that means tv shows could begin every half hour. It does not mean that TV shows are finished in 30 minutes
The clock cycle time of movies in multi-creen theatres (i.e. parallel) is 5 minutes, which means we can trugger a "movie starting" every five minutes... it does NOT mean the movies are 5 minutes long.
 ___    ___    ___
/   \__/   \__/   \

What has a clock?
- RAM
- CPU
- Graphics cards GPUs
- BUS

With paralellism we want to finish them as much as possible that is our bandwidth

## von Neumann Datapath 
(inside the CPU) `page 57`

`Program counter` (PC) - holds the main memory (RAM) address of the next instruction to be FDE (Fetch-decode-execute) it knwos the next instruction and where

How many registers do you have in your computer approx? 16 floating point registers - you dont need tha tmany you only need to make sure it has teh proper data in it that is all. Its just like you live 100 years you dont need to store 100 years of food you only eat a little at a time just like a register it takes in a little at a time.

- Program counter is what pulls it into the register file

FETCH
It will grab (FETCH) what it needs in the main memory then bring it into the register through the bus. 

DECODE
- it will decode in the register file - so it will be like of you either want to put it back in main memory or put it in another register
It will grab the register value it wil put each one its its own input register 

ALU
- will do arithmetic
- it will then add the register 3+4 and will put the total number back into the output register which now will be 7 

Output register
- you can choose to either shell it out in teh register for future use or shell it out to RAM for later

Eventually everything goes back to main memory then goes back to hard drive

`Instruction Register` (IR) - holds the currently-executing instruction

## Wishlist of how to speed up instructions
- page 63 - 65
1. all instructions should be directly executed by hardware (hardware is faster than software - the more hardware the more expensive):   complex and expensive
2. issue instructions as fast/often as possible  complex and expensive and physics limits (how fast 1ns for copper wire etc you need to think of the type of wire and length an heat or wires too close together)
3. instructions should be easy to decode(takes time):   backwards compatibility, same sized instructions (can be complicated it takes time to decode)
4. Only LOAD and STORE instructions should reference main memory (ex you enver know what food or extra things you need to buy fro food in a month)(you cannot ever get 100% hit rate):   cannot avoid going to Main Mememory (MM) (RAM)
5. provide lots of registers (if you hate going to the store you can buy a bigger fridge but there is a limit - there will be a waste some will go bad - we can only guess in a small amount of time what words we need in the future - if we put the wrong words it will go stale if we add too many words)    Expensive

GOAL: Prevent the CPU from starving

- CPU is usually idl
- if we didn't upgrade anything then we will just wait faster

### RISC vc CISC
`Reduced instruction set computer` (RISC):   fewer, and simpler instructions ex: 3+3+3+3+3=15 - takes for cycles is fast

- we want the msot common isntructions and put thm in hardware because its faster. its always faster than software.
- software is slower it will require conversion to hardware

`Complex instruction set computer` (CISC):   more, and more complex instructions: ex implement the most common instructions directly in hardware (no interpretation required), even the complex ones ex: 3*5=15  - few step but bigger step

OUR computer is a mix: mostly RISC with some CISC

- it pays to put them in hardware if you are doing them often

https://cs.standford.edu/people/eroberts/courses/soco/projects/risc/risccisc


The CISC approach attempts to minimize the number of isntructions per program, sacrificing the number of cycles per instruction. RISC does the opposite, reducing the cycles per instruction at the cost of the number of instructions per program.


** IMPORTANT **
look at drawing bottom of page

## There are two priniciples of locality
1. Spacial

2. Temporal

drawings:
1. The cpu wants one single word. It issues a request to Main Memory for that word
2. The cache is checked first
- if the cache has that word, then it's requesteed to the cpu
- if the cache does not have that word, then that word PLUS ITS NEIGHBORS are detched from Main Memory and the request word is forwarded to the CPU

Programs tend to run in order. If the CPU is requesting word 6000 right now, words near 6000 are likely to be requested next/soon

therefore bring to the cache, which has faster access times then Main Memory.

The program of the CPU and everything - everything goes in order

`principal spacial locality` - grab what you can in order

Cache grabs words around (fixed sized box)

Ex you hear someone talk about Tiger woods. You might then bet money on what you will hear next which might be (block of words)
- golf
- Michael Jordan
- hole in one
- masters
- win
- cheating
- car crash
- phil
this is what you might here in the next minute or two not what they might talk about 1 hour from now. This is a `high hit rate.`
- we can peed up our computer with principal spatial locality
- we can make use of this the cache controller will bring in blocks of memory containing words located physically near a recently requested word. Ths isi why it grabs a block. 
- Then later we walk by those people they might talk about computer architecture but now we will hear other words for a little while.

The msot likely word they will say about TG is tiger words - `temporal locality` saying the same word as the topic

- ex we might use the same data over and over which calls it many times
- then we might keep it int he register so we dont get it replaced in the near future.

- In computer programming, progams tend to run in linear order. If the CPU, for example, requested word 6000, it is likely that soon words around 6000 will be requested. This is called the `principal of spatcial locality`. Because of the principle of spatial locality, negihtboring words are fetched into the cache whenever memory words are, because cache serves words faster to the CPU. Analogy: If you hear people talking about Tiger Woods, you can guess words they will probably say inteh near future (2 minutes?): golf, cheater, titles, sports, nike. Another anaology: If you see someone at the store with taco shells int heir basket, you can guess other items that will be in there too: beef, cilantro, cheese, sour cream.

There is also a `principle of temporal locality`, which means the same word being requested now, will likely be re-requested again soon. Because of the principle of temporal locality, the cache tries to keep recent words there (don't let them get evicted). Analogy: you hear someone in teh hallway talkinga bout Tiger Woods. You can guess some words they'll say (probably) in the near future: Tiger Woods.

- CPU doesn't know the main memory exists.

- with no cache to boot up windows it will take how much longer? It took about 2 hours. It didn't ahv ea problem doing it as long as you are patient. You dont need cache but then you will need a lot of patience.

`translation` takes the whoel thing at once then runs it then you dont need the other program.

DEFINITION: `Interpreter`

Any software program (aka virutal machine) that FDE (fetch, decodes, and executes) the instructions of another program. The output of this is another program that is simpler to run. But, this process takes time. this i cheaper than having hardware run the original (more complex, higher-level) program and it is cheaper than having hardware do the conversion (interpretation)


## Pipelines
Refer to page 66 of the textbook
Analogy: Acomputer pipeline is a set of multiple hardware devices in that FDE instruction in parallel and in serie, in order ot maximize instructional bandwidth.
- its like an assembly line. How long does it take ot make a honda? 12 hours. How long doe sit take to make a Bugatti? 6 months
- why is there a big difference? they don't use an assembly line 

A car assembly line is a set of multiple hardware devices that build cars in paralel and in series, in order ot maximize car-creation bandwidth. Assembly, lines can build cars in a way that is `simpler cheaper and faster`
assemply line to build cars = pipelien to FDE instruction
goal: fast, cheap, simple process to maximize bandwidth
multiple stages (lots of hardware), `working in parallel and in series`

time: 84:00




