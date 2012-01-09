// jedi programming language
// Jacob M. Peck

// an In/out port, queue based

Port := Object clone do(
  contents := list
  
  asString := method(
    self contents asString
  )
  
  push := method(x,
    self contents append(x)
  )
  
  pop := method(
    self contents removeFirst
  )
  
  size := method(
    self contents size
  )
  
  asList := method(
    self contents
  )
)