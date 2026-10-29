pub struct Program {
  pub version : Int
  pub statements : Array[String]
}

pub fn parse(tokens : Array[Token]) -> Program {
  let mut version = 1
  let mut statements : Array[String] = []
  
  let mut i = 0
  while i < tokens.length() {
    match tokens[i] {
      Number(n) => { version = n }
      StringLit(s) => { statements.push(s) }
      _ => {}
    }
    i = i + 1
  }
  { version, statements }
}
