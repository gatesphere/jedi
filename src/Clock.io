// jedi programming language
// Jacob M. Peck

Clock := Object clone do(
  clone := method(self) // singleton
  meditations := list
  running := false
  
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
  
  deregister := method(meditation,
    //writeln("Attempting to deregister " .. meditation .. ".")
    self meditations remove(meditation)
    self
  )
  
  stop := method(
    self running = false
    self
  )
  
  workToDo := method(
    //writeln("Checking for work to do...")
    if(self meditations size == 0, return false)
    retval := false
    self meditations foreach(m, if(m workToDo, retval = true; break))
    retval
  )
  
  // run the clock
  start := method(self run)
  run := method(
    self running = true
    
    //writeln("running clock...")
    while(self running and self workToDo,
      self tick;
      //wait(2)
    )
  )

)
