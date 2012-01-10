// jedi programming language
// Jacob M. Peck

// load core libs
doRelativeFile("Clock.io")
doRelativeFile("Port.io")
doRelativeFile("Meditation.io")
doRelativeFile("Contemplation.io")
doRelativeFile("Disturbance.io")

// load data types
doRelativeFile("EndSymbol.io")
doRelativeFile("Tuple.io")
Range

// define built-in functions
echo := method(x,
  if (x != EndSymbol,
    echoNoNewLine(x .. "\n")
  )
  x
)

echoNoNewLine := method(x,
  if(x != EndSymbol,
    write(x)
  )
  x
)

detach := method(x, // should detach the machine without stopping the clock
  Clock deregister(self)
  x
)

die := method(x, // should stop the clock and detach the machine, not kill the program
  if(x == EndSymbol,
    Clock deregister(self);
    Clock stop
  )
  nil
)

pause := method(x, // should stop the clock
  Clock stop
  x
)

empty := method(x,
  nil
)

error := method(x,
  self parent error(x)
)

member := method(x, // x is a two-tuple
  x first contains(x second)
)

size := method(x,
  x size
)

meditate := method(Clock start)

sleep := method(System exit)

// end file
nil
