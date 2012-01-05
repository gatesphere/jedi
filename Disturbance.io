// jedi programming language
// Jacob M. Peck
// 20120104

Disturbance := Object clone do(
  body ::= block(x, x)
  destination ::= nil
  data := nil
  
  init := method(
    body = block(x, x)
    destination := nil
    data = nil
  )
  
  condition := method(in, true) // unfiltered by default
  
  feed := method(in,
    self data = in
    self
  )
  
  load := method(
    self destination feed(self data)
    self data = nil
    self
  )
  
  calculate := method(
    self data = self body call(self data)
  )
  
)
