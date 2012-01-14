// jedi programming language
// Jacob M. Peck

// TODO:
// define(sym)
// detect strings


Lexer := Object clone do(
  version := "January 2012"
  
  clone := method(self) // singleton
  
  embeddedSymbols := Map with(
    "--", symbol("BLOCK_DELINEATOR"),
    "reflect", symbol("KW_REFLECT"),
    "consider", symbol("KW_CONSIDER"),
    "meditate", symbol("KW_MEDITATE"),
    "sleep", symbol("KW_SLEEP"),
    "def", symbol("KW_DEFFUN"),
    "fn", symbol("KW_ANONFUN"),
    "..", symbol("OP_RANGETO"),
    ".", symbol("KW_END"),
    ":", symbol("OP_SYMBOL"),
    ",", symbol("KW_NEXT"),
    "(", symbol("PAREN_LEFT"),
    ")", symbol("PAREN_RIGHT"),
    "[", symbol("BRACKET_LEFT"),
    "]", symbol("BRACKET_RIGHT"),
    "{", symbol("BRACE_LEFT"),
    "}", symbol("BRACE_RIGHT"),
    "|", symbol("KW_DISTURBANCE"),
    "->", symbol("KW_POINTSTO"),
    ":>", symbol("OP_ATTACH"),
    "++", symbol("OP_CONCATENATE"),
    "::", symbol("KW_BEHAVIOR"),
    "+", symbol("OP_PLUS"),
    "-", symbol("OP_MINUS"),
    "*", symbol("OP_TIMES"),
    "/", symbol("OP_DIVIDE"),
    "%", symbol("OP_MODULO"),
    "||", symbol("OP_WHERE"),
    "or", symbol("OP_LOGICALOR"),
    "and", symbol("OP_LOGICALAND"),
    "not", symbol("OP_LOGICALNOT"),
    "xor", symbol("OP_LOGICALXOR"),
    "nand", symbol("OP_LOGICALNAND"),
    "=", symbol("OP_ASSIGN")
  )
  
  state := nil // use for determining multi-part symbols (such as strings split over multiple lines or by special symbols
  
  containsAny := method(sym,
    self embeddedSymbols keys foreach(i, if(sym == i, return false)) // prevent recursion
    self embeddedSymbols keys foreach(i, if(sym containsSeq(i), return true))
    false
  )
  
  run := method(file,
    output := list
    file readLines foreach(lineno ,line,
      line splitNoEmpties(" ") foreach(sym, // first fine-grained search, catches most
        if(sym beginsWithSeq("//"), break) // ignore comments
        self analyze(file name, lineno + 1, sym, output) //else, analyze
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
    x := sym findSeqs(self embeddedSymbols keys)
    head := sym exSlice(0, x index)
    if(head size > 0, out append(head))
    out append(x match)
    tail := sym exSlice(x index + x match size)
    if(tail size > 0, out append(tail))
    out
  )
  
  define := method(sym, // actually do the analysis here    
    out := self embeddedSymbols at(sym)
    if(out == nil, out = symbol(sym))
    out
  )
)
