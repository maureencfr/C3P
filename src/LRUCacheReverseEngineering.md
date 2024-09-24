# Reverse Engineering : LRU Cache

## What is an LRU Cache ?

A LRU (Last Recently Used) cache is a cache(memory which temporarily stores copies of data from a source, in order to reduce the time required for subsequent access) that memorize the list of last asked elements and excluded the element asked for the longer time.

An alternative to LRU is LFU, it counts how often an item is needed and excludes the element that was used less. The difference beetwen LRU and LFU is the characterictic of exclusion : in LRU it's the older time and in LFU it's the minimum used.

## Giving a quick look of the project

For interesting classes I found LRUCache. It implements a LRUCache and its comments explain the behaviour of a LRUCache.
I think we can ignore the methods about "weight" and the accessing-statistics protocol. We do not need that to understand the functioning of the LRU Cache. I think that the "handle" methods can be intersting to.

The Following example create a new LruCache and for 50 times repeat this operation :
- choose a randomly n between 0 and 100
- search if the primes factors of n are already in the cache
- if not it calculate the primes factors and add it to the cache

## From a user perspective: Understanding incomping dependencies

at:ifAbsentPut has 428 senders. There are calls not to LRUCache but in XMLParser.

There are 12 references to LRUCache and 1 of them is test. There are usages to create arrow images and the GitHub api cache for example.

## Implementor’s Hat: Inserting entries in the cache

The code for the hits is the call to the method handleHit and the code for the miss is the ifAbsent bloc. To understand insertion we have to dive into the miss code.

I could ignore error handling because it's already explain in comment and it does not make me understand better the method, and ignore the keyIndex part.

The insertion happens at that line : *link := lruList addLast: association.*









