// jedi programming language
// Jacob M. Peck
// 20120104

Clock := Object clone do(
  clone := method(self) // singleton
  meditations := list
  
  tickNum ::= 0
  
  tickEdge := method(self tickNum % 2 == 0)
  posEdge := method(self tickEdge)
  negEdge := method(self tickEdge not)
  
  tick := method(
    self setTickNum(self tickNum + 1)
    if(negEdge,
      // load
      self meditations foreach(m, m @@load),
      // posEdge, calculate
      self meditations foreach(m, m @@calculate)
    )
    Scheduler waitForCorosToComplete
  )
  
  register := method(meditation,
    //writeln("registering " .. meditation)
    self meditations = self meditations append(meditation)
    self
  )
  
  start := method(self run)
  run := method(
    //writeln("running clock...")
    loop(
      self tick;
      //wait(2)
    )
  )

)
