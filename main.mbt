fn main {
  let tokens = @lex.lex(code)
  let ast = @parse.parse(tokens)
  let vm = compile(program)
  @interp.interpret(ast)
  println("[GRVM] Starting Gengine Ramos VM v0.1.0...")
  vm.run()
  println("[GRVM] Halt.")
}
fn darved {
  let args = get_args() // ["dar", "add", "http"]
  
  if args.length() < 2 {
    dar_help()
    return
  }

  match args[1] {
    "init" => dar_init()
    "add" => {
      if args.length() > 2 { dar_add(args[2]) }
    }
    "install" => dar_install()
    "remove" => {
      if args.length() > 2 { dar_remove(args[2]) }
    }
    "run" => {
      if args.length() > 2 { dar_run(args[2]) }
    }
    "build" => dar_build()
    _ => dar_help()
  }
}
