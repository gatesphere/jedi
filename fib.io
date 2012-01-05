// jedi programming language
// Jacob M. Peck
// 20120105

// Fibonacci number generator example

doFile("Tuple.io")

// get nth fib number
n := System args at(1)
if(n == nil,
  writeln("usage:\n  io fib.io n\nwill calculate the nth Fibonacci number.");
  System exit
)
n = n asNumber round

// define the meditation
fib_machine := Meditation clone

// define the contemplations
start := Contemplation clone setBody(block(x, x))
end := Contemplation clone setBody(block(x, writeln(x); System exit))

// define the disturbances
calc := Disturbance clone 
calc setFilter(
  block(x,
    //writeln("calc received: " .. x);
    if(x != nil, 
      x third != 0,
      false
    )
  ) 
)
calc setBody(
  block(x,
    //writeln("calc: " .. x);
    tuple(x second, x second + x first, x third - 1)
  )
)
calc setDestination(start)

done := Disturbance clone 
done setBody(
  block(x, 
    x second
  )
) 
done setDestination(end)

// register the disturbances
start register(calc) register(done)

// register the contemplations
fib_machine register(start) register(end)

// add inputs
fib_machine addInput(tuple(1,1,n))

// register the meditation
Clock register(fib_machine)

// start the clock
Clock start
