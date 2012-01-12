// jedi programming language
// Jacob M. Peck

IDGenerator := Object clone do(
  id ::= Map clone
  
  clone := method(self) // singleton
  
  generateID := method(type,
    gen := "__" .. type .. "_" .. self get(type)
    self increment(type)
    gen
  )
  
  get := method(type,
    self id atIfAbsentPut(type, 0)
  )
  
  increment := method(type,
    self id atPut(type, self id at(type) + 1)
  )
)