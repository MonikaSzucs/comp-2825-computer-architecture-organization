# Class 9

- Chapter 4 microarchitecture diagram. Figure 4.1 pg 243
- google: one bus data path computer architecture

## 9-1
important: The CPU bus stores only ONE word per cycle.

`PC`: program counter. A register that stores the main-memory address of the next instruction to be fetched, decoded and executed.

`IR`: Instruction Register. Stores the current instruction (the one just fetched, the one about to be decoded, and then executed)

`F`: fetch instructions from main memory
`D`: decoded what is detched
`E`: execute what was decoded

`MAR`: Stores memory addresses

`MDR`: Stores memory data. Data that is going to the memory or data that's coming back from the memory.

- the bus is the main player that is what connects all the pieces.

## 9-2
- fetching starts with program counter.
- PC stores Main memory addres. It knows the next instruction I want is in cell 127 of memory. However for now we draw a squiggle (unknown) we dont know what it is yet until it is decoded later.
- the program counter knows we want 127. Therefore we need an arrow to go from PC to CPU bus to MAR. Then we will issue a read/wait
- the data from 127 will show up in MDR. 
- then we watch to take it out of the MDR (the fetched instruction) it will put it on the bus. Then take it off the bus and put it in the IR. It will decode it and then the instruction decoder will start controlling the ALU.
- the instruction might say: add whatever is in R1 with whatever is in R2 and store it in R3.
- then we will put R1 on the CPU bus and put it into Y. Stay there for a second
- on the next cycle R2 will be put on the CPU bus and put into ALU.
- then it will bring whats in Y into ALU. It will enable both items in ALU and it will either ADD, OR not, Addition. Then it will bring it to Z
- then take it out of Z and go to the CPU bus and go into R3 because that is what the instruction said

ALU knows addition so it will move it from 127 to 128 based on principle of spacial locality so you will need to update the program counter you need a twoway arrow.

- the PC will move that upgrade value from 127 to 128
- MDR needs to be two way because ALU writes there sometimes.

Quiz question
1. Why is the PC a two way arrow?
- sometimes the PC talks to the rest of the system and here is the value and sometimes the systems talks to the PC to update the value. Read value/write value this is why its a two way arrow

- you will need to draw the arrows for a quiz.

- IR is not a two way arrow b/c it never puts things in the bus it receives info then passes to instruction decoder. It fetches. Then sends to decoder then gets executed in ALU

- PC is left at 127 it is stuck in a loop. So we have to do something else actually.

## 9-4
- We will fetch an ddecode an instruction. We will want to add R1 plus R2 and store it in R3
- everything on the datapath on the right is faster then the left.
- 127 is in the PC. Put it on the Bus. Its the only word on the bus then goes to MAR. 
- Then goes to Address bus and issue a read. Then it will go to the left and it will be told to wait for `memory function to complete (WMFC)`. 
- Instead of just waiting you can do something. 
- since 127 was on the bus it automatically goes to the arrow poing to ALU
- it will clear Y to O (this just clears it) and then carry in C(in) is 1
- Y is a register
- it will add 127 + 1
- Z will be 128 which will go to the bus it will go into the PC (program counter) and also it will overwrite the arrow going to ALU.
- now the PC is ready for the next instruction.
> part of the fetch is incrementing the program counter
- at thend of the wait then teh squiggle is fetched into the MDR. It goes to the bus it overwrite the 128 and overwrites the line dgoing to ALU. It also goes to IR. it goes into the instruction decorder. It will decode that squiggle so it can read it saying ADD R1 and R2 and put it in R3.
- then CPU will grab whats in R1 = 5, it goes to th ebus and over writes the squiggle then goes into Y then waits
- the boxes on the elft side of the cpu bus lock the data in so if things get over written in the cpu bus its fine we have them locked in already in the PC, MAR and MDR
- when data is dont waiting and ready it goes ont he data bus
- the next cycle it grabs R2 and puts it in the cpu then goes to ALU arrow. 
- now the ALU adds the 6 + 5 = 1
- Z is now 11 it goes to the bus it goes into the bus and then R3. 11 also goes to the arrow going from cpu to ALU.
- now we ware are ready to fetch the values in PC from 128 for the next instruction

- we can count how many things were on the cpu bus which tells us how many cycles. - we had 6 words on the bus so we took at least 6 cycles. If we want to do things faster then we need more bus's since bus's can only have one thing at a time. `Bus is the slowest part`.

## Coding 9-5
Question
Write the microcode to FDE the instruction ADD R4, R4, R4, R5

