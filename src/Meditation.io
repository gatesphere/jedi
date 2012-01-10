// jedi programming language
// Jacob M. Peck

Meditation := Object clone do(
  input := Port clone
  output := Port clone
  error := Port clone
  contemplations := list
  sealed := false
  
  // each meditation is unique
  init := method(
    self input = Port clone
    self output = Port clone
    self error = Port clone
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
  
  workToDo := method(
    (self isEmpty and self input size == 0) not
  )

  // add contemplation, which also adds a reference to self into the contemplation
  register := method(contemplation,
    //writeln("registering contemplation " .. contemplation)
    if(contemplation type != "Contemplation",
      Exception raise("Cannot register type " .. contemplation type .. " to a Meditation."),
      self contemplations appendIfAbsent(contemplation);
      contemplation registerParent(self)
    )
    self
  )
  
  // add in to the input queue
  addInput := method(in,
    self input push(in)
    self
  )
  
  // add each item of in into the queue
  addInputList := method(in,
    in foreach(i, self addInput(i))
    self
  )
  
  addInputPort := method(port,
    self input = port
    self
  )
  
  getInputPort := method(
    self input
  )

  // load
  load := method(
    //writeln("meditation loading...")
    self contemplations foreach(c, c @@load)
    if(self isEmpty and self isSealed,
      self unseal
    )
    if(self input size != 0 and self isSealed not,
      self contemplations first @@feed(self input pop);
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
    self output push(x)
    x
  )
  
  detach := method(x, // should detach the machine without stopping the clock
    Clock deregister(self)
    x
  )

  die := method(x, // should stop the clock and detach the machine, not kill the program
    if(x == EndSymbol,
      Clock deregister(self);
      Clock stop
    )
    nil
  )
  
  // allow output to be set to an external port
  addOutputPort := method(port,
    self output = port
    self
  )
  
  getOutputPort := method(
    self output
  )
  
  // append to error
  error := method(x,
    self error push("Error: .. " .. x)
    x
  )
)
