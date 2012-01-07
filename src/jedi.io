// jedi programming language
// Jacob M. Peck

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
  die(x)
)

die := method(x, // should stop the clock and detach the machine, not kill the program
  if(x == EndSymbol,
    System exit,
    nil
  )
)

pause := method(x, // should stop the clock
  die(x)
)

empty := method(x,
  nil
)

out := method(x,
  self parent out(x)
)

error := method(x,
  self parent error(x)
)

// end file
nil
