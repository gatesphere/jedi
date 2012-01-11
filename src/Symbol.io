// jedi programming language
// Jacob M. Peck

symbol := method(name,
  SymbolTable get(name)
)

Symbol := Object clone do(
  str ::= ""
  
  init := method(
    self str = ""
  )
  
  with := method(string,
    Symbol clone setStr(string)
  )
  
  asString := method(
    ":" .. self str
  )
)

SymbolTable := Object clone do(
  table := Map clone
  
  clone := method(self) // singleton
  
  get := method(name,
    self table atIfAbsentPut(name, Symbol with(name))
  )
)
