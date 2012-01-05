// jedi programming language
// Jacob M. Peck
// 20120104

Object tuple := method(
  t := Tuple clone
  call message argsEvaluatedIn(call sender) foreach(i, t append(i))
  t
)
  

Tuple := List clone do( // flesh out in the future
  asString := method(
    "(" .. self join(", ") .. ")"
  )
)
