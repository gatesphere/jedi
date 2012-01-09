# jedi Programming Language 

Copyright (c) 2012, Jacob Peck, All Rights Reserved.

## Overview

jedi is a small, experimental language focused on two fundamental concepts: immutable state and dataflow.  jedi is not a dataflow language (such as [Mana](https://github.com/jeremytregunna/Mana)), nor is it a functional language (such as [Haskell](http://www.haskell.org/haskellwiki/Haskell)).  Rather, jedi is a representational language founded upon a few featured data types: disturbances and contemplations, which map directly to edges and states of a finite state machine model of computation, here modeled as a meditation.

### Syntax example

The syntax might look a little like this:
  
    // this is a comment
    fib_machine [  // this is a meditation (a FSM)
      start -> // this is a contemplation (a state) without output (Mealy style)
        | (_,y,0) :: fn((_,y,0)) = y -> end // this is a disturbance (edge) with output (Mealy)
        | (x,y,z) :: fn((x,y,z)) = (y, x+y, z-1) -> start // Mealy disturbance
      
      end :: fn(x) = die(echo(x)) -> . // this is a contemplation with output (Moore style).  The . denotes an end state.
    ] // end fib_machine
    
    reflect --
    (1,1,5) :> fib_machine // this attaches the tuple (1,1,5) to fib_machine's input
    --
    
    meditate // this starts the clock
  
The above would calculate the 5th number in the Fibonacci sequence.  Using the example above as a guide, a hello world example could be built as follows:

    echo_machine [
      start :: fn(x) = echo(x) -> .
    ]
    
    reflect --
    "hello, world!" :> echo_machine
    --
    
    meditate
    
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
    * Symbol
  * Collections
    * Range (not lazy evaluation... just rule-based lists)
    * Tuple (fixed-length list... used to fake multiple parameter passing, and for simulating state)
    * List
    * Map

### Concurrency

Concurrency is achieved by simply creating and registering multiple meditations before starting the clock.  Each machine will run independently of the other, with separate input and separate output.  The machines will run in lockstep, as the clock's tick is tied directly to the method of propagating data through the pipeline.  Calculations within the independent machines are also performed concurrently, through the use of the actor/coroutine model provided by Io.

### Architecture

The architecture of jedi is an abstract virtual machine.  This machine is made of extended finite state machines (meditations), which are in turn composed of states (contemplations) and edges (disturbances), each of which may have behavior in the form of an anonymous filter function, or simply be conditional branching points.  A program in jedi consists of one or more of these meditations linked together by input/output ports, supported by a monolithic clock which governs the control and dataflow of the meditations currently active.

The meditations are strictly limited to a single piece of data at any time, and in fact will seal themselves as soon as a piece of data enters the start state, and unseal themselves as soon as a piece of data is removed (via the empty(x) function).  The first contemplation defined in a meditation is the start state.

The contemplations are states which may or may not have behavior attached to them.  Such behavior is limited to a simple filter function, which may take in exactly one parameter and return exactly one value.  A function may call other functions through function composition to achieve complex results.  However, this need not be a limitation on the code, as with constructs such as tuples and lists (which can be recursively nested as much as needed), great computation can be afforded with a simple filter function.  Also, should the programmer desire, they may implement a form of currying through successive contemplations and disturbances.

The disturbances are edges between the states, guarded by a binary expression which is pattern-matched against the data to enter the disturbance.  The disturbances are checked in order of definition, until a true result is found, at which point, that data enters the disturbance.  Disturbances may have behavior in an identical manner to the contemplations above.  In addition, disturbances have exactly one destination, which must be a contemplation.

The input/output ports are simple queues which are used to connect machines.  Multiple machines may write to them simultaneously, and multiple machines may read from them.  They are implemented as a FIFO queue.

The monolithic clock acts as a control system.  The clock has certain meditations registered to it as active.  When the clock ticks, it is either in a positive edge or a negative edge, in alternating order.  On the negative edges, the clock tells every meditation to load data, i.e., move them along inside the machine.  If a machine is unsealed (and therefore empty), the clock feeds it with the next piece of data from it's input port, if any such data exist.  On the positive edge, the clock tells each active machine to calculate, i.e. run it's functions.  Any contemplation or disturbance with a piece of data currently inside will activate it's function with the data it is currently carrying as it's parameter.  The output of this function will replace the data currently in that location.  When the clock detects that there are no more machines attached to it, it will sleep until told to run again by the `meditate` command.

The standard library will consist of a number of convenience functions.  These functions will be so designed as to allow interactions with the clock and the underlying Io architecture from an isolated and threadsafe environment.

## Why jedi?  

Because I want to try my hand at creating something new and unique.  I don't expect this language to gain much (if any) traction whatsoever, and I have absolutely no experience in creating a language.  But what better way to learn than to try?

## Requirements

Jedi is being written in [Io](http://www.iolanguage.com/), and targeting Io (on the Io Virtual Machine).  Future implementations may target [Caribou](https://github.com/jeremytregunna/caribou) or the Java Virtual Machine.

For the current Io version, you need a working copy of Io with support for the Range addon.  The binaries of the [iobin project](http://iobin.suspended-chord.info/) should provide this support.

## License

See [license/license.txt](https://raw.github.com/gatesphere/jedi/master/license/license.txt) for terms and conditions.

## To do

Here is a short list of things that need to be done:

  * Meditations: assign input ports to allow multiple machines to share the same input
  * Work on clock: pause/restart, detach meditations
  * Build standard library
    * Symbol.io
  * Organize the whole system in a jedi namespace (may not be necessary?)
  * Formally define syntax (write a grammar)
  * Write a lexer/parser/compiler
    * Make a parse-table
    * Internal ID generator
    * Compile to valid Io code

