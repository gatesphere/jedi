// jedi programming language
// Jacob M. Peck
// 20120105

// load core libs
doRelativeFile("Clock.io")
doRelativeFile("Meditation.io")
doRelativeFile("Contemplation.io")
doRelativeFile("Disturbance.io")

// load data types
doRelativeFile("EndSymbol.io")
doRelativeFile("Tuple.io")

// define built-in functions
echo := method(x,
  writeln(x)
  x
)

die := method(x, // should stop the clock/detach the machine, not kill the system
  if(x == EndSymbol,
    System exit,
    nil
  )
)

empty := method(x,
  nil
)

// end file
nil
