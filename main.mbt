fn main {
  let tokens = @lex.lex(code)
  let ast = @parse.parse(tokens)
  @interp.interpret(ast)
  println("[GRVM] Starting Gengine Ramos VM v0.1.0...")
  vm.run()
  println("[GRVM] Halt.")
}
}
