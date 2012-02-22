// jedi programming language
// Jacob M. Peck

/*  reference
    "\"", symbol("STRING_QUOTE"),
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
    "==", symbol("OP_EQUALS"),
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
*/

Parser := Object clone do(
  version := "February 2012"
  
  clone := method(self) // singleton
  
  currentMode := nil
  workingStack := list
  
  output := list
  
  run := method(in,
    in foreach(tok, self parse(tok))
    output
  )
  
  parse := method(token,
    // unambiguous symbols
    token first switch(
      symbol("OP_CONCATENATE"),
        workingStack push(".."),
      symbol("OP_PLUS"),
        workingStack push("+"),
      symbol("OP_MINUS"),
        workingStack push("-"),
      symbol("OP_TIMES"),
        workingStack push("*"),
      symbol("OP_DIVIDE"),
        workingStack push("/"),
      symbol("OP_MODULO"),
        workingStack push("%"),
      symbol("OP_LOGICALOR"),
        workingStack push("or"),
      symbol("OP_LOGICALAND"),
        workingStack push("and"),
      symbol("OP_LOGICALNOT"),
        workingStack push("not"),
      symbol("OP_LOGICALXOR"),
        workingStack push("xor"),
      symbol("OP_LOGICALNAND"),
        workingStack push("nand"),
      symbol("OP_ASSIGN"),
        workingStack push("="),
      symbol("OP_EQUALS"),
        workingStack push("=="),
      symbol("STRING"),
        workingStack push(token second)
    )
)