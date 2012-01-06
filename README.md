# jedi Programming Language 

Copyright (c) 2012, Jacob Peck, All Rights Reserved.

## Overview

jedi is a small, experimental language focused on two fundamental concepts: immutable state and dataflow.  jedi is not a dataflow language (such as [Mana](https://github.com/jeremytregunna/Mana)), nor is it a functional language (such as [Haskell](http://www.haskell.org/haskellwiki/Haskell)).  Rather, jedi is a representational language founded upon a few featured data types: disturbances and contemplations, which map directly to edges and states of a finite state machine model of computation.

### Syntax example

The syntax might look a little like this:
  
    // this is a comment
    fib_machine [  // this is a meditation (a FSM)
      start -> // this is a contemplation (a state) without output (Mealy style)
        | (_,y,0) :: fn((_,y,0)) = y -> end // this is a disturbance (edge) with output (Mealy)
        | (x,y,z) :: fn((x,y,z)) = (y, x+y, z-1) -> start // Mealy disturbance
      
      end :: fn(x) = echo(x) -> . // this is a contemplation with output (Moore style).  The . denotes an end state.
    ] // end fib_machine
    
    (1,1,5) :> fib_machine // this attaches the tuple (1,1,5) to fib_machine's input and starts fib_machine
  
The above would calculate the 5th number in the Fibonacci sequence.  Using the example above as a guide, a hello world example could be built as follows:

    echo_machine [
      start :: fn(x) = echo(x) -> .
    ]
    
    "hello, world!" :> echo_machine
  
Simple enough, right?

### Type system support

Planned types:

  * Primitives
    * Integer
    * Float
    * Char
    * String
    * Boolean
    * Meditation (FSM)
    * Contemplation (state)
    * Disturbance (edge)
    * Function (filter style: exactly one input and exactly one output)
  * Collections
    * Range
    * Tuple (fixed-length list)
    * List
    * Map

## Why jedi?  

Because I want to try my hand at creating something new and unique.  I don't expect this language to gain much (if any) traction whatsoever, and I have absolutely no experience in creating a language.  But what better way to learn than to try?

## Requirements

Jedi is being written in [Io](http://www.iolanguage.com/), and targeting Io (on the Io Virtual Machine).  Future implementations may target [Caribou](https://github.com/jeremytregunna/caribou) or the Java Virtual Machine.

For the current Io version, you need a working copy of Io with support for the Range addon.  The binaries of the [iobin project](http://iobin.suspended-chord.info/) should provide this support.

## License

See [license/license.txt](https://raw.github.com/gatesphere/jedi/master/license/license.txt) for terms and conditions.

## To do

Here is a short list of things that need to be done:

  * Attach output to end states
  * Create an error output buffer
  * Ensure only one piece of data is in a machine at a time
  * Formally define syntax (write a grammar)
  * Write a parser/compiler
  * Build standard library
    * Rewrite Tuple.io
