# Class 5

|   x   |   y   | x nor y |
| ----- |:-----:| -------:|
|   0   |   0   |    1    |
|   0   |   1   |    0    |
|   1   |   0   |    0    |
|   1   |   1   |    0    |

We are going to build a 64-bit register. 
Start by building a ONE bit register
The bit we are storing is called "Q":
- Q to 1
- reset Q to 0
- neither set nor reset (ie remember Q)

set = S
reset = R

|   S   |   R   |    Q    |
| ----- |:-----:| -------:|
|   0   |   0   |    Q    |
|   0   |   1   |    0    |
|   1   |   0   |    1    |
|   1   |   1   |    ?    | 

- the ? is a problem
- we can make somekind of memory that is set or reset and stores (read/write) the current state
- starts at state Q and doesn't change from state Q - its in whatever state it is in

SR Latch -> unclocked D Latch -> clocked D latch -> D flip flop

## SR Latch
see drawings SR latch 5-1
- don't set or reset and then everything in Q and Qnot is maintained

## Unclocked D latch
see drawings 5-2
D - for satta just like set
- we need an inverter it looks like a triangle
- the unlocked D latch will not allow S= R - 1
so we dont' get Q = Qnot that is good
but it also will not allow S = R = 0 this is bad - this is not even a memory

## notes
 __
/  \
- a `clock` is anything that can be turned on or off
- especially if it is periodic it has a rising and falling edge

## Clocked D Latch
- now lets add a clock
5-2 and 5-3
- it can work now
- see new truth table:

|   D   |   Clock   |    Q    |
| ----- |:---------:| -------:|
|   0   |     0     |    Q    |
|   0   |     1     |    0    |
|   1   |     0     |    Q    |
|   1   |     1     |    1    | 

- Q is maintined if clock is off
- if you want to write or maintain the data you need to turn the clock on

- we dont want individual clocks

## 4 bit word
5-4
- must change and freeze at the same time so we need a single clock

clock needs to be controlled
only D value can change

## Rising edge trigger (aka pulse generator)
5-5-1

## 4 bit flip flop
5-5-2
This will periodically put out a 1 only when it is a 1 then writting can happen
- they share a pulse generator
- each register has 1 clock
- in reality there are 64 of these they are 1/64 of the same word
- each bit of one word will stay in sync

## Ex
- 100 m dash 
- how do they get people to start at the same time? How od they make sure 8 peopel start running at the same time? They shoot a gun. Why a gun? It is instantanous its trying to be 0 time

- when you are in high school you ahve 5 mins to change classes but in this case in running a race you want it instant

Ch 3 digital logic level in text book

## Multiplexer (Mux) or combinational circuit
pg 76 - 4x 3 register set

## 5-6
- if we want to read/write the clock has to be on
- Data in - 3 minutes because 3 bits in each word
- address decoder - is a selector - it determins which word is being read.
- CS = chip select will always be 1 because we are selecting this chip
- RD - read - if you want this to read you must set this to 1 but if you want it to write you set it to 0. You are either doing one or the other
- OE - output enable - do you want the output yes or no?
- O0, O1, O2 is the output

- tri-state noninverting buffer  - its not an inverter it has 3 possible states:
0
1
NOTHING

nothing is not the same as 0

Ex sink - cold, hot, no water

## Multiplexer 5-7
- show all the input and output values needed to write 010 to word 3

## 5-8

## 5-9

## 5-10
Does this arithmetic logic:
AND 00
OR
NOT 
FULL ADDITION (ie with carry in)

|   ARITH LOGIC   |   ##   |
| --------------- | ------:| 
|   AND           |   00   |  
|   OR            |   01   |   
|   NOT           |   10   | 
|   ADDITION      |   11   |

## 5-11

> start at 2:26


A multiplexer("mux") is a combined circuit with:
n control signals
2^n input
one output

A blue light turns on if the water is cold
A red light on if the water is hot and overflowing
A yellow light turns on if the water is cold or overflowing

### Question
draw the truth table and multiplexer implementation of this word problem