// jedi programming language
// Jacob M. Peck

// A generic end symbol to signal the end of input.  Die reacts to this.

EndSymbol := Object clone do(
  clone := method(self)  // singleton
  asString := ":___end___"
)
