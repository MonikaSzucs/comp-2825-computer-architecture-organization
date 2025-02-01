# Class 3

## On a quiz say
with code x a 9 bit error is not correctable because we will assume we are in the wrong direction so we will get close to the wrong word and we will try to make it better so we will aim for another bit

## Error detection and error correcting codes
- ex error correcting code (ECC) ram

- when we save word in ram, How do we know it is correct? There could be errors in that process.

Probability
- tradeoff:
CLAIRITY VS SPACE

## Two things we are trying to do today
- error detection
- error correction

Example:
- Hey do you want to meet at my house or at the pub?
reply: bub
- there is a error there. How do we know there is an error there? Its not in our dictionary we only gave two options. 

A dictionary is called a `code` - is our dictionary of valid words
- we need to agree on these words

- some words are valid some words are not.
- bub is not an option. However, where do we think they want to meet us? The pub.

## Worse errors
- hey were do you want to meet at my house or the pub?
reply: pub 
- they screwed up so much they wanted to say house. This is one of the worst cases.

- sometimes words are so far awpart it is easy to fix them.

## Example
hospitalizatiom
it should be hospitalization - it is far away from other words so it gives us clairty since its far from other words. 

## example
but
- there is so many other words like put, mut, hut etc would be hard to fix or know what the person really wanted to say

## Example
- the further distance between targets the less like we will hit wrong target or make any mistakes like hitting the middle and it will be asier to detect and correct errors. Then we can tell where the person was trying to hit

Code A
00000000
11111111

`Hamming distance` of a code is the minimum number of bits different between any two words
HD = 8bits

received: 00000001
- we got a single bit of error but it is probably supposed to have been 00000000

received:
00001111
- it can either be all 0 or all 1
- we did not agree on this so the error detection 
- that's a `detectable but uncorrectable error`

you sent 00000000
i receieved 11111111
- we would't do anything because we think thats what they wanted
- `undetectable error therefore uncorrectable`

received:
00000011
- we would say it is probably suposed to have been all 0's
- so we fix it to all 00000000
- and usually we would be right


received:
00000011
- what if this was supposed to be all 1's?
- then again we have a `detectable error but uncorrectable error.` We don't know we are wrong.
to be clear: we would "change it" to 00000000 and not know we were wrong.

## how can we make this code better?
Code X
0000 0000 0000 0000
- lets choose a 16 bit word instead of 8 bit word

Why is this new code better than code A?
- more clairity
- we can fix a 4 bit error now with code x

0000 0000 0000 1111
- we can fix a 4 bit error no problem now comepared to before
- we can fix up to a 7 bit error

- if its 8 bit error then its in the middle so its detectable but uncorrectable

## On a quiz say
with code x a 9 bit error is not correctable because we will assume we are in the wrong direction so we will get close to the wrong word and we will try to make it better so we will aim for another bit


- anyway more than half way wrong we will assume is the other target and it is a wrong assumption. 
- we can only fix a  less than 50% of hamming distance of errors

- code X hamming distance is 16 bits
- we can fix 1-7 bit errors
- an 8 it error is unfixable looks exactly half like each of 2 words
- 9 to 15 bit erros make the word more closely look like a WRONG word: unfixable too

- a 16 bit error is not even detectable 
Ex. send 1111 1111 1111 1111
receieve 0000 0000 0000 0000
so 16 bit errors are `neither detectable nor correctable`

7 bit error: 
sent:       0000 0000 0000 0000
received:   1111 1110 0000 0000
looks like more 0's so it is probably all 0's and that is correct

- if it is a 9 bit error or more then we cannot correct it because we will think the wrong thing and its unfixable

## Why don't we use a million 0's or 1's?
- it would take a lot of space
- lots of hardware
- after a while its too much

Code A
00000000
11111111

## Third word 
- anything that is half and half is a good third word 11110000

00000001 this is a bad third word because it is too close and difficult to detect errors. Now we cant fix a 1 bit error with a 1 bit hamming distance 
- if one bit goes off then its a undetectable error which is really bad.

## Do we want a large or small hamming distance? Why?
- we want a large hamming distance for clairty because we can correct larger errors.
- more things can go wrong and you can detect them

0000 0000
1111 1111
- hamming distance = 8 this is better

0000 1111
0000 0000
- hamming distance of 4

0000 0000
0000 0001
- hamming distance of 1 bit that is bad

- not 8 because it is a valid word but not the one intended
- any more than half it looks like the wrong word
Hamming distance        # of detectable errors      # of correctable errors
8                       7                           3
16                      15                          7
1000                    999                         499
41                      40                          20
17                      16                          8
h(variable for forumla) < h                         < h/2


------
## problem solving
Hamming Code
dataword: the raw to store
codeword: the dataword plus extra bits

Extra bits are called `pairity bits`
aka redundant bits
aka check bits

we must actually store the (longer) codeword in order to save and retrieve the orginal datawords with the ability to detect and correct errors

### Example see sheet

## What if we said odd parity
01 0 0 110 1 1
Answer: 100111001 just flip the parity bits (leave databits alone)

## Next weeks quiz
- you wil have to draw it, show your work and upload a picture of it

## The following Hamming codewords was made using even parity:
a. are there errors? Yes
b. where? how do you know? bit 6 (bits 2 and 4 seem wrong 2+4 = 6)
c. What was the original dataword supposed to have been?
- leave out the parity bits fix the wrong bits:
10010

Same question but now codeworde made with odd parity
Answer: bit 9 (=1+8); the original dataword would have been 10110

## Question 2
The following Hamming codewords was made using even parity:
a. are there errors? 
b. where? how do you know? 
c. What was the original dataword supposed to have been?

011000011011

## Extra notes
`Dataword`:	The raw data we want to store or send Ex 10011
`Codeword`:	The dataword plus extra bits. The extra bits are called parity bits and they are what allow us to detect / correct errors
