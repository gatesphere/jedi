// jedi programming language
// Jacob M. Peck
// 20120104

Meditation := Object clone do(
  input := list
  output := list
  error := list
  contemplations := list
  sealed := false
  
  // each meditation is unique
  init := method(
    self input = list
    self output = list
    self error = list
    self contemplations = list
    self sealed = false
  )
  
  // ensure single piece of data
  isSealed := method(sealed)
  seal := method(self sealed = true)
  unseal := method(self sealed = false)
  
  // is it empty?
  isEmpty := method(
    empty := true
    self contemplations foreach(c,
      if(c isEmpty not,
        empty = false; break
      )
    )
    empty
  )
  
  // add contemplation, which also adds a reference to self into the contemplation
  register := method(contemplation,
    //writeln("registering contemplation " .. contemplation)
    self contemplations = self contemplations append(contemplation)
    contemplation registerParent(self)
    self
  )
  
  // add in to the input queue
  addInput := method(in,
    self input := self input append(in)
    self
  )

  // load
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
  
  // calculate
  calculate := method(
    //writeln("meditation calculating...")
    self contemplations foreach(c, c @@calculate)
  )
  
  // append to output
  out := method(x,
    self output = self output append(x)
    x
  )
  
  // append to error
  error := method(x,
    self error = self error append("Error: .. " .. x)
    x
  )
)
