// jedi programming language
// Jacob M. Peck
// 20120104

Disturbance := Object clone do(
  body ::= block(x, x)
  destination ::= nil
  data := nil
  filter ::= block(true) // unfiltered by default
  
  init := method(
    self body = block(x, x)
    self destination := nil
    self data = nil
  )
  
  condition := method(in,  
    self filter call(in)
  )
  
  feed := method(in,
    //writeln("fed data: " .. in)
    self data = in
    //writeln(self data)
    self
  )
  
  load := method(
    //writeln("disturbance loading...")
    if (self data != nil,
      self destination feed(self data);
      self data = nil
    )
    self
  )
  
  calculate := method(
    //writeln("disturbance calculating...")
    //writeln(self data)
    if(self data != nil,
      self data = self body call(self data)
    )
    //writeln("  " .. self data)
  )
  
)
