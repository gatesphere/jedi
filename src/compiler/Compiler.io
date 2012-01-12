// jedi programming language
// Jacob M. Peck

Compiler := Object clone do(
  
  compile := method(file, outfile,
    input := File openForReading(file)
    done := CodeGenerator with(Parser with(Lexer with(input contents)))
    input close
    output := File openForAppending(outfile)
    output write(done) flush close
  )
  
)
    