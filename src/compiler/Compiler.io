// jedi programming language
// Jacob M. Peck

Compiler := Object clone do(
  
  compile := method(file, outfile,
    input := File openForReading(file)
    done := CodeGenerator run(Parser run(Lexer run(input)))
    input close
    output := File openForAppending(outfile)
    output write(done) flush close
  )
  
)
