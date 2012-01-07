// jedi programming language
// Jacob M. Peck
// 20120104

Disturbance := Object clone do(
  body ::= block(x, x)
  destination ::= nil
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
      self data = self body call(self data)
    )
    //writeln("  " .. self data)
  )
  
)
