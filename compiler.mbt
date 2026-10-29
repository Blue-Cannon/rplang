// compiler.mbt - Compiles RPLang AST to GRVM bytecode

pub fn compile(program : Program) -> GRVM {
  let vm = GRVM::new()
  
  for stmt in program.statements {
    vm.emit(Say(stmt))
  }
  
  vm.emit(End)
  vm.emit(Halt)
  vm
}
