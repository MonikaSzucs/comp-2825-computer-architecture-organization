# class 2

## Definitions
`clock` - anything that can be turned on and off
`clock cycle`   - ex 100MHz bus frequency: 100 million cycles per second;
                100 * 10^6
                - Period = 1/frequency; 1/1M = 1 microsecond = 10^-6
                when we talk about clock sits power of 10
                1GHz = 1,000,000,000 cycles/second; corresponds to 1/100,000,000th second/cycle (1ns)

1GHz cpu    - 1 billion rising and falling edges per second
            - 1 rising edge per nanosecond
            - POSSIBLE we could `start` one instruction each nanosecond

The clock cycle of cable TV shows is 30 minutes: that means tv shows could begin every half hour. It does not mean that TV shows are finished in 30 minutes
The clock cycle time of movies in multi-creen theatres (i.e. parallel) is 5 minutes, which means we can trigger a "movie starting" every five minutes... it does NOT mean the movies are 5 minutes long.
 ___    ___    ___
/   \__/   \__/   \

What has a clock?
- RAM
- CPU
- Graphics cards GPUs
- BUS

With paralellism we want to finish them as much as possible that is our `bandwidth`

## von Neumann Datapath 
(inside the CPU) `page 57`

`Program counter` (PC) - holds the main memory (RAM) address of the next instruction to be FDE (Fetch-decode-execute) it knows the next instruction and where

How many registers do you have in your computer approx? 16 floating point registers - you dont need that many you only need to make sure it has the proper data in it that is all. Its just like you live 100 years you dont need to store 100 years of food you only eat a little at a time just like a register it takes in a little at a time.

- `Program counter` is what pulls it into the register file

FETCH
It will grab (FETCH) what it needs in the main memory then bring it into the register through the bus. 

DECODE
- it will decode in the register file - so it will be like of you either want to put it back in main memory or put it in another register
It will grab the register value it wil put each one its its own input register 

ALU
- will do arithmetic
- it will then add the register 3+4 and will put the total number back into the output register which now will be 7 

Output register
- you can choose to either shell it out in the register for future use or shell it out to RAM for later

Eventually everything goes back to main memory then goes back to hard drive

`Instruction Register` (IR) - holds the currently-executing instruction

## Wishlist of how to speed up instructions
- page 63 - 65
1. all instructions should be directly executed by hardware (hardware is faster than software - the more hardware the more expensive):   complex and expensivne
2. issue instructions as fast/often as possible  complex and expensive and physics limits (how fast 1ns for copper wire etc you need to think of the type of wire and length an heat or wires too close together)
3. instructions should be easy to decode(takes time):   backwards compatibility, same sized instructions (can be complicated it takes time to decode)
4. Only LOAD and STORE instructions should reference main memory (ex you ever know what food or extra things you need to buy for food in a month - words go stale just like bread)(you cannot ever get 100% hit rate):   cannot avoid going to Main Mememory (MM) (RAM)
5. provide lots of registers (if you hate going to the store you can buy a bigger fridge but there is a limit - there will be a waste some will go bad - we can only guess in a small amount of time what words we need in the future - if we put the wrong words it will go stale if we add too many words)    Expensive

GOAL: Prevent the CPU from starving

- CPU is usually idl
- if we didn't upgrade anything then we will just wait faster

### RISC vc CISC
`Reduced instruction set computer` (RISC):   fewer, and simpler instructions ex: 3+3+3+3+3=15 - takes for cycles is fast

- we want the most common instructions and put them in hardware because its faster. its always faster than software.
- software is slower it will require conversion to hardware

`Complex instruction set computer` (CISC):   more, and more complex instructions: ex implement the most common instructions directly in hardware (no interpretation required), even the complex ones ex: 3*5=15  - few step but bigger step

OUR computer is a mix: mostly RISC with some CISC

- it pays to put them in hardware if you are doing them often

https://cs.standford.edu/people/eroberts/courses/soco/projects/risc/risccisc


The CISC approach attempts to minimize the number of instructions per program, sacrificing the number of cycles per instruction. RISC does the opposite, reducing the cycles per instruction at the cost of the number of instructions per program.


** IMPORTANT **
look at drawing bottom of page

## There are two priniciples of locality
1. Spacial
- refers to the tendency of a program to access data or instructions that are located near each other in memory.
2. Temporal
- refers to the tendency of a program to access the same data or instructions repeatedly over a short period of time.

drawings:
1. The cpu wants one single word at a time. It issues a request to Main Memory for that word
2. The cache is checked first
- if the cache has that one word at a time, then it's requested from main memory. It doesn't even know cache exists
- CPU knows the program counter for the next instruction it wants
- the closer you are to the CPU the more expensive it is, the faster it is, the smaller it is

Programs tend to run in order. If the CPU is requesting word 6000 right now, words near 6000 are likely to be requested next/soon

therefore bring to the cache, which has faster access times then Main Memory.

- CPU is intercepted by the cache. The cache will ask if it has 6000 but CPU doesn't know CACHE exists. CPUS asks for 6000 but cache will check and if it does have it will give it him. If the CPU asks for 6000 every time the cache will be checked first and if it is not there then cache will fetch a block of words around 6000 then forward that one request to the CPU. It will only forward 6000 but it is grabbing a group of the numbers because it might need something related to it.
- Then i might ask for 6001 and cache will say I have it
- but once it asks for 6006 it will check itself if it doesn't have it then it will grab it and with some words around in to get more `hits` for later. Programs tend to run in `linear order`

The program of the CPU and everything - everything goes in order

- the code only does not go in order if its in a loop, if statement, method or function call 

`principal spacial locality` - grab what you can in order. What you are using now is tended to be used again very soon.
- issues one request per address because it only stores one word in a register. Then it sends out a request only to main memory and it doesn't know about the cache.

CPU
- sends out request only to main memory it doesn't know about cache
- CPU issues the request 
- cache will check itself first. If it does then give it to the CPU over a data BUS. 
- if cache doesn't contain the word then it will grab a fix sized box with a bunch of numbers then computer programs tend to run in order.
- requesting instructios from memory. These are addresses of instructions. 
- if you bring in 5500 to 6500 then the next one it will want is probably in that block you have already grabbed



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
- we can make use of this the cache controller will bring in blocks of memory containing words located physically near a recently requested word. This is why it grabs a block. 
- Then later we walk by those people they might talk about computer architecture but now we will hear other words for a little while.

The most likely word they will say about TW is tiger woods - `temporal locality` saying the same word as the topic

- ex we might use the same data over and over which calls it many times
- then we might keep it in the register so we dont get it replaced in the near future.

- In computer programming, progams tend to run in linear order. If the CPU, for example, requested word 6000, it is likely that soon words around 6000 will be requested. This is called the `principal of spatcial locality`. Because of the principle of spatial locality, negihboring words are fetched into the cache whenever memory words are, because cache serves words faster to the CPU. Analogy: If you hear people talking about Tiger Woods, you can guess words they will probably say in the near future (2 minutes?): golf, cheater, titles, sports, nike. Another anaology: If you see someone at the store with taco shells in their basket, you can guess other items that will be in there too: beef, cilantro, cheese, sour cream.

There is also a `principle of temporal locality`, which means the same word being requested now, will likely be re-requested again soon. Because of the principle of temporal locality, the cache tries to keep recent words there (don't let them get evicted). Analogy: you hear someone in the hallway talking about Tiger Woods. You can guess some words they'll say (probably) in the near future: Tiger Woods.

- CPU doesn't know the cache exists.

- with no cache to boot up windows it will take how much longer? It took about 2 hours. It didn't have a problem doing it as long as you are patient. You dont need cache but then you will need a lot of patience.

`translation` takes the whole thing at once then runs it then you dont need the other program.

DEFINITION: `Interpreter`

Any software program (aka virutal machine) that FDE (fetch, decodes, and executes) the instructions of another program. The output of this is another program that is simpler to run. But, this process takes time. this is cheaper than having hardware run the original (more complex, higher-level) program and it is cheaper than having hardware do the conversion (interpretation)


## Pipelines
Refer to page 66 of the textbook

Henry ford - assembly line

Analogy: A computer pipeline is a set of multiple hardware devices in that FDE instruction in parallel and in serie, in order to maximize instructional bandwidth.
- its like an assembly line. How long does it take to make a honda? 12 hours. How long does it take to make a Bugatti? 6 months
- why is there a big difference? they don't use an assembly line 

A car assembly line is a set of multiple hardware devices that build cars in paralel and in series, in order to maximize car-creation bandwidth. Assembly, lines can build cars in a way that is `simpler cheaper and faster`

assemply line to build cars = pipeline to FDE instruction
goal: fast, cheap, simple process to maximize bandwidth
multiple stages (lots of hardware), `working in parallel and in series`

- a car is an instruction for example

## Terms
`instructional latency` - the total time an instruction (car) spends in the pipeline (assembly line), from start to finish. Ex 66 min/car

`Instructional bandwidth` - the number of instructions finishing per unit time: ex 1 car/ 60 min   (1 divided by the slowest stage time)

`Von neuman bottle neck` - when the person/robot is busy and has to wait until it can move along the pipeline/assembly line.

`super scalar architecture` - extra hardware at the slowest stages - requires more money for more things to happen in parallel

- there is no direct relationship between latency and bandwidth
- a longer/deeper/lengthen pipeline can increase bandwidth and may lengthen, shorten, or not affect the latency

- sometimes it doesn't matter when latency is high but we will see soon why.

- no direct relationship between latency and bandwidth

Ideal pipeline:
- no bottle necks
- no slowest stage
- superscalar architecture: extra hardware at the slowest stage

- you can also lengthen the pipeline
The new pipeline maybe now has 15 stages that takes 30 seconds - deepending pipeline
`instructional latency`: 7.5min/car
`Instructional bandwidth`: 2car/min

## Netflix
When netflix first opening then you say you want to watch it but when you actual do that? it may take days before. But they got the latency way down.
original latency: several days

### What would low bandwidth look like for Netflix?
- buffering
- low resolution
- stuttering

## Playland vs disneyland
Playland
- latency: time on the ride (you dont want a super long or super short ride)
- bandwidth: # people exiting the ride / time
... of a rollercoaster - they have lots of boats where people enter and exit constantly it just requires money

Disneyland
- ex like a small world people wait in line for long time you get a long time on the ride. They cut down the wait time by adding more money to create more seats with no gaps so every 10 seconds someone comes on and off the ride.

## What are the latency and bandwidth of a pipeline whos stages at 20ns, 15ns, 40ns, 5ns?
Latency:    20+15+40+5 = 80ns/instruction
bandwidth:  1 instruction / 40 ns   (1/slowest stage)

## Question
What are the latency and bandwidth of this assembly line:
Stages take 15 min, 4 min, 1 min, 24 min, 16 min, and 120 seconds

1. we need to first change seconds to minutes
120 seconds = 2min
latency: sum of all times of all stages: 15+4+1+24+16+2=62mins/unit
bandwidth: 1 unit / slowest stage = 1unit/24 minutes

for next weeks quiz practice with a combination of stages with times in ms, us, ns, ps



