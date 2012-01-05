// jedi programming language
// Jacob M. Peck
// 20120104

Clock := Object clone do(
  clone := method(self) // singleton
  
  tickNum ::= 0
  
  tickEdge := method(self tickNum % 2 == 0)
  posEdge := method(self tickEdge)
  negEdge := method(self tickEdge not)
  
  tick := method(
    self setTickNum(self tickNum + 1)
    if(negEdge,
      // load
      writeln("loading"),
      // posEdge, calculate
      writeln("calculating")
    )
  )
  
  start := method(self run)
  run := method(
    loop(
      self tick
    )
  )

)
