// jedi programming language
// Jacob M. Peck
// 20120105

// hello world example

// load the jedi language
doFile("../src/jedi.io")

// define the machine
echo_machine := Meditation clone

// define the contemplations
start := Contemplation clone setBody(block(x, echo(x)))
end := Contemplation clone setBody(block(x, die(x)))

// define the disturbances
done := Disturbance clone setDestination(end)

// register the disturbances
start register(done)

// register the contemplations
echo_machine register(start) register(end)
echo_machine addInput("Hello, world!")
echo_machine addInput("I'm feeling awesome!")
echo_machine addInput("And now I'm done.")
echo_machine addInput("Bye!")
echo_machine addInput(EndSymbol)

// register the meditation
Clock register(echo_machine)

// start the clock
Clock start
