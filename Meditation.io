// jedi programming language
// Jacob M. Peck
// 20120104

Meditation := Object clone do(
  input := list
  output := list
  contemplations := list
  
  init := method(
    input = list
    output = list
    contemplations = list
  )
  
  register := method(contemplation,
    self contemplations = self contemplations append(contemplation)
    self
  )
    
  addInput := method(in,
    self input := self input append(in)
    self
  )

  load := method(
    self contemplations foreach(c, c load)
    self contemplations first feed(self input pop)
  )
  
  calculate := method(
    self contemplations foreach(c, c calculate)
  )
)
