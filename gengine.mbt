// gengine.mbt - Gengine Ramos VM

pub enum Opcode {
  Say(String)  // say "Hello"
  End
  Halt
}

pub struct GRVM {
  mut bytecode : Array[Opcode]
  mut ip : Int // instruction pointer
}

pub fn GRVM::new() -> GRVM {
  { bytecode: [], ip: 0 }
}

pub fn GRVM::emit(self : GRVM, op : Opcode) -> Unit {
  self.bytecode.push(op)
}

pub fn GRVM::run(self : GRVM) -> Unit {
  self.ip = 0
  while self.ip < self.bytecode.length() {
    match self.bytecode[self.ip] {
      Say(s) => println(s)
      End => {}
      Halt => break
    }
    self.ip = self.ip + 1
  }
}
