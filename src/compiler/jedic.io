// jedi programming language
// Jacob M. Peck

version := "February 2012"

doRelativeFile("../jedi.io")
JediCompiler
Lexer
Parser
CodeGenerator
IDGenerator


writeln("jedic, the jedi compiler version " .. version)
writeln("part of the jedi programming language")
writeln("Jacob M. Peck\n")

writeln("Lexer version: " .. Lexer version)
writeln("Parser version: " .. Parser version)
writeln("Code Generator version: " .. CodeGenerator version)
writeln("---")

filename := System args at(1)

writeln("Compiling file " .. filename) 
JediCompiler compile(filename, filename .. ".io")
