// jedi programming language
// Jacob M. Peck
// 20120104

Meditation := Object clone do(
  input := list
  output := list
  error := list
  contemplations := list
  sealed := false
  
  init := method(
    self input = list
    self output = list
    self contemplations = list
    self sealed = false
  )
  
  isSealed := method(sealed)
  seal := method(self sealed = true)
  unseal := method(self sealed = false)
  
  isEmpty := method(
    empty := true
    self contemplations foreach(c,
      if(c isEmpty not,
        empty = false; break
      )
    )
    empty
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
    self contemplations foreach(c, c @@load)
    if(self isEmpty and self isSealed,
      self unseal
    )
    if(self input size != 0 and self isSealed not,
      self contemplations first @@feed(self input removeFirst);
      self seal
    )
  )
  
  calculate := method(
    //writeln("meditation calculating...")
    self contemplations foreach(c, c @@calculate)
  )
)
