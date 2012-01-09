// jedi programming language
// Jacob M. Peck

Disturbance := Object clone do(
  body ::= block(x, x)
  destination := nil
  data := nil
  filter ::= block(true) // unfiltered by default
  parent := nil
  
  // each disturbance is unique
  init := method(
    self body = block(x, x)
    self destination := nil
    self data = nil
    self filter = block(true)
    self parent = nil
  )
  
  setDestination := method(contemplation,
    if(contemplation type != "Contemplation",
      Exception raise("Cannot set the destination of a Disturbance to type " .. contemplation type .. "."),
      self destination = contemplation;
      self
    )
  )
  
  // is it empty?
  isEmpty := method(
    self data == nil
  )
  
  // register the parent contemplation
  registerParent := method(contemplation,
    self parent = contemplation
    self
  )
  
  // test the guard
  condition := method(in,  
    self filter call(in)
  )
  
  // insert data
  feed := method(in,
    //writeln("fed data: " .. in)
    self data = in
    //writeln(self data)
    self
  )
  
  // load
  load := method(
    //writeln("disturbance loading...")
    if (self data != nil,
      self destination feed(self data);
      self data = nil
    )
    self
  )
  
  // calculate
  calculate := method(
    //writeln("disturbance calculating...")
    //writeln(self body)
    //writeln(self data)
    if(self data != nil,
      self data = self body clone setScope(self) call(self data)
    )
    //writeln("  " .. self data)
  )
  
  // support for out method
  out := method(x,
    self parent out(x)
  )
  
)
