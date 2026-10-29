pub fn interpret(program : Program) -> Unit {
  // Check LANG version
  if program.version != 1 {
    println("RPLang Error: Only LANG:1 is supported in v0.1.0")
    return
  }
  // Execute say
  for stmt in program.statements {
    println(stmt)
  }
}
