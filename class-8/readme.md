# Class 8

## Homework For This week - Due Before Class
Asynchronous Expanation


## Notes 7-1
In order to answer questions about this synchonous bus read timing diagrams, we need:

- the diagram
- the table
- the bus frequency (pg 191: 100MHz)
- the memory speed (pg 192: 15ns memory)

Contains three things
- CPU
- memory
- BUS

frequency: 100MHZ: 100 000 000 cycles / second
period: the inverse of the frequency
1/100 000 000 cycles per second

10ns/cycle

If the frequency were 1GHz: 1 billion cycles/second
the period is 1 billionth second/cycle = 1ns/cycle

## 7-2
- Clock rises and falls 100 million times per second
- `Address bus`: the CPU sends the address it wants to read, to the memory
- `Data bus`: the memory puts the data from the memory cell at the given address on the data bus, to send it to the CPU (which requested it)

- MREQ (memory request), RD (read), and WAIT are "control signals" they are either low or high
- low means "on"
- high means "off"

- the _ bar over top of the MREQ, RD, WAIT means "asserted when low"
- the memory request signal is sent along with the RD (or "not RD" which menas "WRITE") by the CPU
- WAIT the memory tells the CPU to either wait or stop waiting 
- the memory is too slow to keep up with the CPU 
- the CPU must wait

## 7-3
- the CPU does the Fetch Decode and execute (FDE) cycle. This diagram shows the fetch part
- at the start (rising edge) of some cycle (call it T1), the CPU starts putting the main memory address of a word it wants onto the bus. After a few ns, the address is stable and usable by the memory. After a small delay, the CPU says I am making a memroy request about this address." 
- for us in COMP 2825, it will always be READ.
- The memory does some math and determines that its too slow ( the CPU is too fast), so at the start of the next cycle, the data will NOT be ready, so the main memory tells the CPU "wait this cycle out". The following cycle (in this example) at the start, the main memory knows that the fetched word WILL be ready in that cycle, so it tells the CPU NOT to wait that cycle (ie get the word). The data must reach the CPU and then settle down in order to be useful.

## 7-4 and 7-5
How do we know each cycle is 10ns? 100MHz we need to be told this

If the memory determined that no wait was necessary, everything could be accomplished in 1.5 cycles instead of 2.5 cycles

- events only happen at "rising" or "falling" edges
- the data is there because its the time window where it is available. And the falling edge of T3 is the first opportunity to use that data during the time window where it's ready.

- it takes up to Tad seconds and up to 4nsec to become stable
- the data takes a long time to become stable the payload is requested by the CPU and its not available for very long time because the bus is slow, the memory is slow. 

- eventually it does like this. At the rising edge of the cycle it fetches the instructions. Then from the Tad it is not stable and usable then it is. Takes up to 4ns to become stable. Then at that point the memory can assume its a read request. It cannot start reading the reqest before Tad because its not ready. It takes non zero time for the address to become stable. 

- Memory being requested. There is no memory request then the drop there is.
- the read request at the drop there is a read
- the memory has to do some math. The data will not be done in T2 it has to do some calculations. It will wait in T2

- it will do the response now at the rising edge to T3 start so then it can stop waiting then it tells the CPU don't wait the data is coming. 
- it will `read` at the `falling edge` before the falling edge of T3.
- Then at Tds the data is available around the middle of Tds because then the falling edge can start reading.

- the Tds needs 2 seconds in order to be usful at the falling edge which is why the data starts before the falling edge of T3.

- hard drive with spinning disk might have a million waits so it is really slow.

## 7-6
- the CPU is ordering a word from memory, the same way a person can order a pizza from pizzeria. 
- before the pizza can be delivered, the pizzeria needs: 
- your address and your order- how long does it take for you to give your address to teh pizzeria via phone? 20 seconds that is Tad

- if you wanted to eat pizza at 7:30 when should it arrive?

5 min earlier that is Tad

## 7-7
- How long does memory have to fetch a word from when the address is stable, with the one wait state as shown?

2.5 cycles * 10ns.cycle - tad - Tds
25ns - 4ns - 2ns = 19ns

## 7-8
- how long with no wait?
25ns - 4ns - 2ns - 10ns(wait gone) = 9ns

- `the memory knows it needs 15ns` (pg 192) so we need to make sure that we get answer > 15ns
- so 9 ns is not enough so it tells the cpu to WAIT for T2
19ns IS enough so it tells the CPU DO NOT WAIT in T3: the data will be ready in Tds ns before the T3 falling edge

## 7-9
How long does memory have to fetch a word from when the address is stable with `one wait state`, 

a. 50MHz but Tad is 12ns, Tds is 14ns
100 MHz = 10ns/cycle
50MHz = 20ns/cycle

1.5cycle + `1 wait cycle` = 2.5cycles   // waiting is a whole cycle ALWAYS

2.5 cycles * 20ns/cycles = 50ns - Tad - Tds 
20 x 2.5 = 50
50ns - 12ns - 14ns = 24ns 

Why do we minus Tds? because we need some buffer time.

Tad = cannot fetch from so far unstable address
Tds = buffer time - data must arrive ahead of time, to settle down and be usable

b. no wait state
24ns - 20ns = 4ns

c. with 6 wait states?
4ns + 6(20ns) = 124ns

### Extra questionsHow long does memory have to fetch a word from when the address is stable with `two wait state`, 

a. 50MHz but Tad is 12ns, Tds is 14ns
100 MHz = 10ns/cycle
50MHz = 20ns/cycle

1.5cycle + `2 wait cycle` = 3.5cycles   // waiting is a whole cycle ALWAYS

3.5 cycles * 20ns/cycles = 70ns - Tad - Tds 
20 x 3.5 = 70
70ns - 12ns - 14ns = 44ns 

Why do we minus Tds? because we need some buffer time.

Tad = cannot fetch from so far unstable address
Tds = buffer time - data must arrive ahead of time, to settle down and be usable

b. no wait state
44ns - 40ns = 4ns

c. with 6 wait states?
4ns + 6(20ns x 2) = 244ns

## 7-10

| frequency (cycles per time) | period (time per cycle) |  |
| :---   |  :---:  | :---:  | 
|  1GHz  |   1ns   |    |
| 100MHz |  10ns   | 100 x 10 = 1000 |
|  50MHz |  20ns   | 50 x 20 = 1000 |
|  25kHz | 40micros | 25 x 40 = 1000  |
| 12.5Hz | 80milliseconds | 12.5 x 80 = 1000  |
|  30MHz |  33.33333333333333333ns   |  1000/33.333 = 30 |
|  250kHz |  4microsec  | 1000/0.004 = 250000 |
|  5Hz |  200millisec  | 1000/200 = 5 |
|  40MHz |  25ns  | 1000/40 = 25 |

How long does memory have to fetch a word from when address is stable?

200MHz bus => 5ns/cycle
2 wait states
Tad = 1.50ns
Tds = 2.50ns

1.5 cycles (always) + 2 cycles (waits) 
= 3.5 cycles - Tad - Tds

3.5(5ns) - 1.5ns - 2.5ns

17.5ns - 4ns = 13.5ns

## 7-11
If it misses Tds it waits til the next cycle

- how long does memory have to fetch a word FROM WHEN THE MEMORY REQUEST IS ASSERTED?

- ie new starting point from which to measure; same ending point

Answer:
There are two ways to calculate this new starting point and we must examine BOTH every time! 
a. use tm - 3ns
b. use Tml - 2ns

We must solve this problem twice use Tm then use Tml and pick the worst case

The answer is the worst case.

- ANALOGY: your a teenager, your mom says to be home at 9pm. You dad says to be home by midnight to stisfy both you must be home by 9 with same question to satify both 

## 7-12
How long does memory have to fetch the word from when the memory request is asserted? 
100MHz bus -> 10ns /cycle
1 wait state

a. use Tm
- Tm is measured from a falling edge and it ends at a falling edge

100Mhz -> 10ns/cycle

falling edge T1 to falling edge T3 = 2 cycles, minus Tm, minus Tds

2 cycles * 10ns/cycle - 3ns - 2ns = 15ns

b. use Tml 
- rising edge T1 to falling edge T3 = 2.5 cycles - Tad - Tml - Tds

2.5 cycles * 10 ns/cycle - 4ns - 2ns - 2ns = 17ns

Answer: pick the worst case
15ns
- these are deadlines. Shorter deadlines are worse

What about no wait states?
15ns - 10ns = 5ns


## 7-13
How long does memory have to fetch a word
a. from when the address is stable
b. from when MREQ is asserted?
40MHz bus
4 wait states
Tad 8ns
Tds 9ns
Tm 10ns
Tml 11ns

1.5 (always) _ 4 wait  = 5.5 cycles

a. 
40MHz -> 25ns/cycle
1.5 + 4 = 5.5 cycles

5.5 cycles * 25ns/cycle = 137.5ns - Tad - Tds
137.5ns - 8ns - 9ns = 120.5ns

b. Use `Tm`
1cycle (always) + 4 waits = 5cycles - Tm - Tds

5(25ns) - 10ns - 9ns = 125ns - 19ns = 106ns

need to go again to use `Tml`

120.5ns - 11ns = 109.5ns

Answer the worst case (shortest deadline): `106ns` which is worse than 109.5ns