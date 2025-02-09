# Quiz 
## Question 1
What is the mean access time for a system with four levels of cache and a main memory? 220 memory accesses were made as follows:
80 were hits in level 1 cache
60 were hits in level 2 cache
30 were hits in level 3 cache
20 were hits in level 4 cache
The rest were hits in main memory.
The access times are:
Level 1: 3ns
Level 2: 8ns
Level 3: 20ns
Level 4: 50ns
Main memory: 200ns
Show/explain your work.

220*3 + 140*8 + 80*20 + 50*50 + 30*200 = 11880ns

660 + 1120 + 1600 + 2500 + 6000 = 11880ns

11880ns/220req = 54ns/request

## Question 2
(a) How long does it take to read a disk with 5000 cylinders, each containing three tracks of 2048 sectors? First, all the sectors of track 0 are to be read starting at sector 0, then all the sectors of track 1 starting at sector 0, and so on. The rotation rate is 6000 RPM, and a seek takes 1 msec between adjacent cylinders and 20 msec for the worst case. Switching between any tracks of a cylinder can be done in 12 msec. (b) Re-do the question but now we don't need to ever start at sector 0; just start at any sector. Show/explain your work.

Part A) Sector 0

tracks : 5000 per platter
draw 3 of: disks
draw 2048 of? pie slices/sectors

6000RPM -> 6000/60 = 100 -> 1/100 = 0.01s/rev -> 10ms/rev

Step 1
best case: 0ms
worst case seek time: 20ms
average case: (0+20)/2 = 10ms

Step 2
wait for sector 0 to spin
to the read/write head 10/2 = 5ms

Step 3
wait time 10-12    mod 10 = 8ms
10 + (12+8) + (12+8) = 50ms

step 4
- seek time between adjacent cylinder is 1ms
Wait for sector 0 to spin
10-1 = 9ms

Step 5
repeat steps 3 and 4 for all 5000 cylinders

50 + 1+ 9 = 60ms

total for all cylinders
5000 x 60 = 300,000ms

add the initial seek and rotational latency:
300,000 10 + 5 = 300,015ms

300.015s

Part B) ANY sector

Step 1
best case: 0ms
worst case seek time: 20ms
average case: (0+20)/2 = 10ms

Step 2
wait for sector 0 to spin
total time to read tracks on one cylinder
10 + 12 + 10 + 12+ 10 = 54

Step 3
seek time between adjacent cylinders: 1ms

Step 4
Repeat step 2 and 3 for all 5000 cylinders
54 + 1 = 55ms
5000 x 55 = 275,000ms

add the initial seek and rotational latency:
275,000 + 10 = 275, 010ms
= 275.010s



