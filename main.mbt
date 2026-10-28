fn main {
  let tokens = @lex.lex(code)
  let ast = @parse.parse(tokens)
  @interp.interpret(ast)
}
