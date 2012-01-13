// jedi programming language
// Jacob M. Peck

// TODO:
// define(sym)

Lexer := Object clone do(
  version := "January 2012"
  
  clone := method(self) // singleton
  
  embeddedSymbols := list("\"", "..", "(", ")", "[", "]", "->", ":>", "++", "::")
  
  state := nil // use for determining multi-part symbols (such as strings split over multiple lines or by special symbols
  
  containsAny := method(sym,
    self embeddedSymbols foreach(i, if(sym == i, return false)) // prevent recursion
    self embeddedSymbols foreach(i, if(sym containsSeq(i), return true))
    false
  )
  
  run := method(file,
    output := list
    file readLines foreach(lineno ,line,
      line splitNoEmpties(" ") foreach(sym, // first fine-grained search, catches most
        if(sym beginsWithSeq("//"), break) // ignore comments
        self analyze(file name, lineno, sym, output) //else, analyze
      )
    )
    file close
    //output println
    nil
  )
  
  analyze := method(filename, lineno, sym, output,
    if(self containsAny(sym), 
      writeln("               --> Complex symbol encountered!");
      self breakDown(sym) foreach(i,  // hidden recursion :)
        self analyze(filename, lineno, i, output)
      )
      return;
    )
    t := tuple(define(sym),sym,filename,lineno)
    t println
    output append(t)
  )
  
  breakDown := method(sym, // break down complex symbols
    out := list
    sym2 := sym
    while(x := sym2 findSeqs(self embeddedSymbols),
      head := sym2 exSlice(0, x index)
      if(head size > 0, out append(head))
      out append(x match)
      sym2 = sym2 exSlice(x index + x match size)
    )
    out
  )
  
  define := method(sym, // actually do the analysis here
    symbol(sym)
  )
)
