// jedi programming language
// Jacob M. Peck
// 20120104

Meditation := Object clone do(
  input := list
  output := list
  contemplations := list
  
  init := method(
    self input = list
    self output = list
    self contemplations = list
  )
  
  register := method(contemplation,
    //writeln("registering contemplation " .. contemplation)
    self contemplations = self contemplations append(contemplation)
    self
  )
    
  addInput := method(in,
    self input := self input append(in)
    self
  )

  load := method(
    //writeln("meditation loading...")
    self contemplations foreach(c, c load)
    if (self input size != 0,
      self contemplations first feed(self input pop)
    )
  )
  
  calculate := method(
    //writeln("meditation calculating...")
    self contemplations foreach(c, c calculate)
  )
)
