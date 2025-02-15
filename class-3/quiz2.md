# Quiz 2

1. In your own words: a) What is the principle of temporal locality? b) how do we make use of it?

a. The principle of temporal locality refers to the idea that if a particular piece of data (or memory word) is accessed at a certain time, it is likely to be accessed again soon. In other words, recently used data is expected to be reused in the near future.

b. We make use of temporal locality by keeping recently accessed data in fast, easily accessible memory (like a cache). This way, when the same data is requested again shortly after its first access, it can be retrieved quickly without having to go all the way back to the main memory. This is why caches are designed to store recently used data and avoid removing it too quickly.

2. In your own words: a) What is the principle of spatial locality? b) how do we make use of it? 

a. The principle of spatial locality means that if a particular memory word (or piece of data) is accessed, nearby memory words are likely to be accessed soon after. In other words, if the CPU is looking for data at a certain location, because it is possible that we will need data close to that location shortly.

b) We make use of spatial locality by fetching not just the requested memory word but also its neighboring words into the cache. This way, if the CPU needs data close to the one it just requested, it can access it more quickly without having to go back to grab more words from main memory. This is why caches are designed to load blocks of memory, rather than individual words, to increase the chances that nearby data is already in cache.

3. Describe why we would make a pipeline LONGER. Show an actual example of your own how this would be a benefit compared to a shorter one 

We can make a pipeline longer so then it can increase bandwidth and it may lengthen or shorten or not affect the latency.

regular: 1min, 1min, 2min, 3min
latency: 7min/car
bandwidth: 1car/3min

longer: 1min, 1min, 1min, 1min, 1min, 1min, 1min
latency: 7min/car
bandwidth: 1car/min

You can see it will change the bandwidth. It would benefit the bandwidth by increasing the number of stages through which the cars (or data) pass in parallel, which improves the bandwidth. Specifically, with a longer pipeline, more cars (or data) can be processed in a given time period (1 car/minute in the longer pipeline compared to 1 car/3 minutes in the regular pipeline).

4. A pipeline has four stages which take 150nanoseconds, 0.3microseconds, 0.5milliseconds, and 400,000 picoseconds. What is the latency and bandwidth of this pipeline? Always show all your work.
-> 150ns   0.3microseconds   0.5ms    400,000ps  ->

0.3microseconds = 0.3 x 1000ns = 300ns
0.5ms = 0.5 x 1,000,000ns = 500,000ns
400,000ps = (400,000/1000) ns = 400ns

-> 150ns   300ns   500,000ns   400ns  ->

latency
150 + 300 + 500,000 + 400 = 500,850ns/data

bandwidth
1data / 500,000ns

5. What a pipeline and what is the purpose of a pipeline in our computer?

A pipeline in a computer is a set of multiple hardware devices that process instructions in parallel and in series to maximize the rate at which instructions can be processed, similar to an assembly line in car manufacturing.

The purpose of a pipeline is to improve instructional bandwidth by breaking down the instruction processing into multiple stages. Each stage handles part of the task, allowing the computer to process several instructions at once, making the system faster, simpler, and more efficient.

Instructional latency is the total time an instruction spends in the pipeline. (time/unit)
Instructional bandwidth is the number of instructions completed per unit of time. (unit/time)
By using a pipeline, the goal is to maximize bandwidth and improve overall system performance. A longer pipeline can increase bandwidth but may or may not affect latency.

6. Very clearly explain what happens when the CPU requests a word from main memory, in your own words

1. The cpu wants one single word at a time. It issues a request to Main Memory for that word
2. The cache is checked first
- if the cache has that one word at a time, then it's requested from main memory. It doesn't even know cache exists
- CPU knows the program counter for the next instruction it wants
- the closer you are to the CPU the more expensive it is, the faster it is, the smaller it is

Programs tend to run in order. If the CPU is requesting word 6000 right now, words near 6000 are likely to be requested next/soon

- CPU is intercepted by the cache. The cache will ask if it has 6000 but CPU doesn't know CACHE exists. CPU asks for 6000 but cache will check and if it does have it will give it him. If the CPU asks for 6000 every time the cache will be checked first and if it is not there then cache will fetch a block of words around 6000 then forward that one request to the CPU. It will only forward 6000 but it is grabbing a group of the numbers because it might need something related to it later.
- Then i might ask for 6001 and cache will say I have it
- but once it asks for 6006 the cache will check itself and if it i doesn't have it then it will grab it from main memory and with some words/numbers around it to get more `hits` for later.