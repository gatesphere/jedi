// jedi programming language
// Jacob M. Peck
// 20120104

Contemplation := Object clone do(
  body ::= block(x, x)
  disturbances := list
  data := nil
  
  init := method(
    self body = block(x, x)
    self disturbances = list
    self data = nil
  )
  
  isEmpty := method(
    empty := true
    if(self data != nil,
      empty = false,
      self disturbances foreach(d,
        if(d isEmpty not,
          empty = false; break
        )
      )
    )
    empty
  )
  
  register := method(disturbance,
    //writeln("registering disturbance " .. disturbance)
    self disturbances = self disturbances append(disturbance)
    self
  )
  
  feed := method(in,
    //writeln("c fed data: " .. in)
    self data = in
    self
  )
  
  load := method(
    //writeln("contemplation loading...")
    // push forward data in disturbances
    self disturbances foreach(d, d @@load)
    // delegate to proper disturbance
    self disturbances foreach(d,
      if(self data != nil and d condition(self data),
        d @@feed(self data); 
        self data = nil;
        break
      )
    )
    if(self data != nil and self disturbances size != 0,
      Exception raise("No match for " .. self data .. " in Contemplation " .. self uniqueId);
      self println
    )
  )
  
  calculate := method(
    //writeln("contemplation calculating...")
    //writeln(self body)
    if(self data != nil,
      self data = self body call(self data)
    )
    self disturbances foreach(d, d @@calculate)
  )
  
)
