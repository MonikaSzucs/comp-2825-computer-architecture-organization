# Class 4

## Example 1
 Create the even parity Hamming codeword for this data word:
 show your work
 clearly identify the pairty bits
 011111001

 ## Notes
`Mean (Average) Memory Access Time`: The average time it takes the CPU to fetch a word from sort of memory (thefetch in the fetch-decode-execute cycle).
1 min to grab from fridge and 1 hour from costco so the mean is the 1 min in fridge with the 1 hour from costco


- we talked about grabbing info for the register from the future like for `principal spacial locality` and `temporal locality`

## Analogy:
- you want some dinner
- Sometimes the food you want is in the fridge
- Sometimes the food you want is at Costco
- Sometimes the food is in between: corner store, save-on-foods, market etc
- The Mean Food Access Time is the average time it takes you to get your food.

## Computer:
- CPU wants a word:
- Sometimes the word the cpu wants is in the registers
- Sometimes the word the cpu wants is on the hard disk drive
- Sometimes the word the cpu wants is in between: cache(s), RAM
- The Mean Memory Access Time is the average time it takes the cpu to get its word.

A `hit` is when the requested word is found.
A `miss` is when the requested word is not found there; in this case the next level of memory is checked. you only check the slower memory when you miss.

- the closest memory is always checked first.
- check cache first for best case

- always check cache first
- hit rate is the percentage rate

Start with a simple case: ONE level of cache, plus main memory:
`Mean Memory Access Time `= cache access time + (1 – hit rate) * main-memory access time
MAT = c + (1-h)m


Start with a simple case: ONE level of cache, plus main memory:
`Mean Memory Access Time` = cache access time + (1 – hit rate) * main-memory access time
MAT = c + (1-h)m

= time to look into fridge + the percentage of time it takes to go to costco

## Questions
a)	What is the MAT if the hit rate is 100%?
The MAT would be the same as the cache access time. But this is impossible. Cache gets loaded only on misses. Main memory must be accessed sooner or later.
Computer never looks in main memory unless its a miss
Its the same as the cache access time (c)

b)	What is the MAT if the hit rate is 0%?
This means nothing that the cpu wants is found in the cache. Time was wasted by looking in the cache. Cache can therefore actually SLOW down the cpu, by having nothing in it, or by having the “wrong words” in it. The MAT is the cache time PLUS main memory access time.
Cache access plus memory access time (note: even worse than if we had NO cache at all!)

c)	What is the MAT if the hit rate is 90%? 
MM takes 80ns; cache takes 6ns.
MAT = 6ns + (1 – 0.9)80ns = 6ns + .1*80ns = 6ns + 8ns = 14ns

d)	What is the MAT if there are TWO levels of cache? 
- Level 1 has an access time of 2ns. Level 2 has an access time of 10ns. Main memory has an access time of 80ns. 200 requests by the cpu were made: 120 were hits in level 1. 60 were hits in level 2. The rest were hit in main memory.

### What is the mean access time for a system with three levels of cache:
- you gets data that is `dirty`

level 1: 4ns
level 2: 12ns
level 3: 20ns
mm: 200ns

300 requests:
200 hits in level 1
50 hits in level 2
35 hits in level 3
the rest hits in mm

-------------------------------------------------
(300 * 4ns)  + (100 * 12ns) + (50 * 20ns)  + (15 * 200ns)
1200ns + 1200ns + 1000ns + 3000ns
6400ns total time for 300 requests
6400ns/300requests = 21.3333 ns/request

e)	What is the MAT if there are THREE levels of cache? Level 1 has an access time of 3ns. Level 2 has an access time of 12ns. Level 3 has an access time of 20ns. Main memory has an access time of 100ns. 300 requests by the cpu were made: 200 were hits in level 1. 60 were hits in level 2. 30 were hits in level 3. The rest were hits in main memory.

300*3ns + 100*12ns + 40*20ns + 10*100ns = 3900ns/300 req = 13ns/req

- Four levels? `Good quiz question.`

## Hard-Disk Drives
- secondary memory
- HDDs are magnetic. They spin. They have concentric circles.
- An optical drive (eg DVD) uses lasers and has spirals.
https://www.youtube.com/watch?v=NtPc0jI21i0

## Notes
The read/write head reads the magnetic bits in the sectors
`seek time`: the time for the read/write head to get to the desired track. The time for the mechanical moving of the arm (we do not have this in a SSD/RAM/Cache)
`rotational latency`: how long it takes for the desired sector to spin to the read/write head (on average this takes half a rotation) - you might need to figure this out if it is missing in a problem

`rings` are called `tracks`
- this is a one hard drive. It has three single-sided platters
- they have magenetic bits met with a magnetic arm
- there is a read/write head it goes to a certain track
- disks are spinning in unison - spinning all the time
- move the arm to the track then wait for the sector - waiting for the spin to bring the right sector to the read/write head

- each platter has four tracks (the colored rings). A track is a ring of magetic bits some fixed distance from the center: 
- red track
- blue track
- orange track
- gray track

- Each track consists of 8 sectors. A `sector` is a segments of a track with a header, data, a footer, and a gap between other sectors

- once the read/write head comes to the platter it will look for the sector which is know as the seek time. Then the head on all tracks are all lined up perfectly. The mechanical moving of the head. Once you done the seek time and you found the first track, you wait for the sector you want to spin under the read/write head. On average it takes half a rotation for a arched read/write head to get its sector rotated underneath it. 

- if there is a number missing like the teacher didn't provide it you might hve to find out the rotational latency

`rev` = revolution
`rpm` = revolutions per minute
- Each cylinder has three tracks

- cylinder is a set of same track on the different platters

- while we move from red to blue track then its still spinning then when it gets there it still needs to spin around to read that track again to get to the right sector

## Quiz question - 120 revolution per min convert it to ms
7200RPM: 120 RPM  (7200/60)
= 1/120th sec/rev = 8.3ms/rev  
5400RMP: 11.1ms/rev = 5400/60 = 90 -> 1/90 = 11.1ms/rev
10800RPM: 5.55ms/rev

- Read blued cylinder from sector 0 to sector 7 of A, then sector 0 to sector 7 of B, then sector 0 to sector 7 of C, then
- Read orange cylinder from sector 0 to sector 7 of A, then sector 0 to sector 7 of B, then sector 0 to sector 7 of C, then
- Read red cylinder from sector 0 to sector 7 of A, then sector 0 to sector 7 of B, then sector 0 to sector 7 of C, then
- read gray red cylinder from sector 0 to sector 7 of A, then sector 0 to sector 7 of B, then sector 0 to sector 7 of C

## What is a track
- the ring of bits, magnetic grooves

4 top
4 middle
4 bottom
12 tracks total

## what is a cylinder?
- the same track across all platters

# Spins
- if we have 3 platter it will take 3 spins one for each platter

## Question #20-1, Page 144:
How long does it take to read a disk with 10,000 cylinders, each containing four tracks of 2048 sectors? First, all the sectors of track 0 are to be read starting at sector 0, then all the sectors of track 1 starting at sector 0, and so on. The rotation time is 10 msec, and a seek takes 1 msec between adjacent cylinders and 20 msec for the worst case. Switching between tracks of a cylinder can be done instantaneously.

### Answer:
draw 10000 tracks.
`what is a track`? 10,000 rings

`draw 4 of`? disks
`draw 2048 of`? pie slices

step 1
- move to track 0
- How long does it take to move the arm to track 0? 
best case 0 
worst case 20ms
average case: (0 + 20)/2 = 10ms

step 2
- wait for sector 0 to spin under the just-positioned read/write
head: average case half a rotation = 5ms

step 3: 
- read all of that track on first platter: one full rotation: 10ms
- then instantaneously switch to the same track (and sector) on the second platter. Then read that track in one rotation: 10ms
- then the third platter: 10ms

step 4:
- move the read/write head to the next cylinder (ie the adjacent track) 1ms

Step 5
- wait for sector 0 to return to read/write head again: 9ms

repeats steps 3-4-5 ten thousand times

4 x 10 = 40ms ??
10ms + 5ms + 10000(40ms + 1ms + 9ms) = 500,015ms = 500seconds

## Question #20-2
How long does it take to read a disk with 4000 cylinders, each containing five tracks of 128 sectors? First, all the sectors of track 0 are to be read starting at sector 0, then all the sectors of track 1 starting at sector 0, and so on. The rotation rate is 7200 RPM, and a seek takes `2 msec` between adjacent cylinders and 18 msec for the worst case. Switching between tracks of a cylinder can be done in 3ms.

draw 4000 tracks on every platter
128 pies/sections per platter
7200 RPM (7200/60) = 120s/rev -> (1/120 = 0.0083s/rev) 8.33ms/rev

step 1
- move the read/write 
- head to the first track
- worst case: 18ms

step 2
- wait for sector 0 to spin
- to the read/write head 4.16666ms (half of one 8.3333ms revolution)

step 3:
- read that track on first platter: 8.3ms
- switch to the next platter: 3ms
- wait for sector 0: 8.3ms-3ms = 5.3ms

step 4:
- do step 3 five times

step 5: 
- seek adjacent cylinder: `2ms`

repeat steps 3-4-5 four thousand times

8.3 is from step 2
3 is how long it takes to switch
5.3 is waiting in sector
18ms + 4.166666ms + 5(8.3+3+5.3)*4000 = 332 seconds

## Question #20-3
How long does it take to read a disk with 400 cylinders, each containing six tracks of 512 sectors? First, all the sectors of track 0 are to be read starting at ANY sector, then all the sectors of track 1 starting at ANY sector, and so on. The rotation rate is 3000 RPM, and a seek takes 2 msec between adjacent cylinders and 30 msec for the worst case. Switching between tracks of a cylinder can be done in 1ms.

3000RPM -> 50RPM -> 1/50th sec/rev -> 20ms/revolution

step 1:
- move to track 0: average of (0 + 30)/2 = 15ms

step 2:
- read that track on the first platter: 20ms

step 3: 
- switch track of that cylinder (ie go to same track next platter): 1ms

do steps 2-3 six times to read each cylinder: 21ns * 6 = 126ms, 
then seek adjacent cylinder (+2ms) = 128ms

step 4: do the previous, 400 times: 400*128ms = 51200ms
51.2 seconds plus step 1: 15ms = 51.215 seconds


## Extra question

How long does it take to read a disk with 6000 cylinders, each containing five tracks
of 256 sectors? First, all the sectors of track 0 are to be read starting at any sector, then
all the sectors of track 1 starting at any sector, and so on. The rotation rate is 3000RPM,
and a seek takes 2 msec between adjacent cylinders and 30 msec for the worst case.
Switching between tracks of a cylinder can be done instantaneously.

-----
-----
-----
-----
-----


draw 6000 tracks
 256 pies

3000RPM (3000/60) = 50 -> 1/50 = 0.02 = 20ms/rev

step 1
- move the read/write 
- head to the first track
- worst case: 30ms
average: 0 + 30 / 2 = 15ms

step 2
- wait for sector 0 to spin
20ms * 5 platters = 100ms

step 3:
seek adjacent cylinder = 2ms

do steps 2 and 3 6000 times
(100+2)102 * 6000 = 612s

> no step 4 because we can start reading at any sector

## When will step 4 be required? if  a question says starting at sector 0
