// jedi programming language
// Jacob M. Peck

JediCompiler := Object clone do(
 
  compile := method(file, outfile,
    input := File openForReading(file)
    done := Parser run(Lexer run(input))
    input close
    output := File openForAppending(outfile)
    output write(done) flush close
  )
  
)
