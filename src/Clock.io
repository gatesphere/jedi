// jedi programming language
// Jacob M. Peck

Clock := Object clone do(
  clone := method(self) // singleton
  meditations := list
  
  tickNum ::= 0
  
  tickEdge := method(self tickNum % 2 == 0)
  posEdge := method(self tickEdge)
  negEdge := method(self tickEdge not)
  
  tick := method(
    self setTickNum(self tickNum + 1)
    //writeln("tick: " .. self tickNum)
    if(negEdge,
      // load
      self meditations foreach(m, m @@load),
      // posEdge, calculate
      self meditations foreach(m, m @@calculate)
    )
    Scheduler waitForCorosToComplete // synchronize ticks
  )
  
  // add a meditation to the clock
  register := method(meditation,
    //writeln("registering " .. meditation)
    self meditations = self meditations append(meditation)
    //writeln(self meditations)
    self
  )
  
  // run the clock
  start := method(self run)
  run := method(
    //writeln("running clock...")
    loop(
      self tick;
      //wait(2)
    )
  )

)
