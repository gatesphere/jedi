// jedi programming language
// Jacob M. Peck
// 20120104

Contemplation := Object clone do(
  body ::= block(x, x)
  disturbances := list
  data := nil
  
  init := method(
    body = block(x, x)
    disturbances := list
    data = nil
  )
  
  register := method(disturbance,
    self disturbances = self disturbances append(disturbance)
    self
  )
  
  feed := method(in,
    self data = in
    self
  )
  
  load := method(
    // push forward data in disturbances
    self disturbances foreach(d, d load)
    // delegate to proper disturbance
    self disturbances foreach(d,
      if(d condition(self data), 
        d feed(self data); 
        self data = nil; 
        break
      )
      if(self data != nil,
        Exception raise("No match for " .. self data .. " in Contemplation " .. self uniqueId);
        self println
      )
    )
  )
  
  calculate := method(
    self data = self body call(self data)
  )
  
)
