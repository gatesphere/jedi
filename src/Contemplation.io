// jedi programming language
// Jacob M. Peck

Contemplation := Object clone do(
  body ::= block(x, x)
  disturbances := list
  data := nil
  parent := nil
  
  // each contemplation is unique
  init := method(
    self body = block(x, x)
    self disturbances = list
    self data = nil
    self parent = nil
  )
  
  // is it empty?
  isEmpty := method(
    empty := true
    if(self data != nil,
      empty = false,
      self disturbances foreach(d,
        if(d isEmpty not,
          empty = false; break
        )
      )
    )
    empty
  )
  
  // register a disturbance, adding a reference to self as parent
  register := method(disturbance,
    //writeln("registering disturbance " .. disturbance)
    if(disturbance type != "Disturbance",
      Exception raise("Cannot register type " .. disturbance type .. " to a Contemplation."),
      self disturbances appendIfAbsent(disturbance);
      disturbance registerParent(self)
    )
    self
  )
  
  // register the parent meditation
  registerParent := method(meditation,
    self parent = meditation
    self
  )
  
  // insert data
  feed := method(in,
    //writeln("c fed data: " .. in)
    self data = in
    self
  )
  
  // load
  load := method(
    //writeln("contemplation loading...")
    // push forward data in disturbances
    self disturbances foreach(d, d @@load)
    // delegate to proper disturbance
    self disturbances foreach(d,
      if(self data != nil and d condition(self data),
        d @@feed(self data); 
        self data = nil;
        break
      )
    )
    if(self data != nil and self disturbances size != 0,
      Exception raise("No match for " .. self data .. " in Contemplation " .. self uniqueId);
      self println
    )
  )
  
  // calculate
  calculate := method(
    //writeln("contemplation calculating...")
    //writeln(self body)
    if(self data != nil,
      self data = self body clone setScope(self) call(self data)
    )
    self disturbances foreach(d, d @@calculate)
  )
  
  // support for out(x) function
  out := method(x,
    self parent out(x)
  )

  // support for error(x) function
  error := method(x,
    self parent error(x)
  )
  
  detach := method(x, // should detach the machine without stopping the clock
    self parent detach(x)
  )

  die := method(x, // should stop the clock and detach the machine, not kill the program
    self parent die(x)
  )
  
)
