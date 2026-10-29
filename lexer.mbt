pub enum Token {
  Use
  Lang
  Colon
  Number(Int)
  Say
  End
  StringLit(String)
  Eof
}

pub fn lex(source : String) -> Array[Token] {
  let tokens : Array[Token] = []
  let lines = source.split('\n')
  for line in lines {
    let trimmed = line.trim()
    if trimmed == "" { continue }
    
    if trimmed.starts_with("USE") {
      tokens.push(Use)
    } else if trimmed.contains("LANG") {
      tokens.push(Lang)
      // extract number after :
      let parts = trimmed.split(':')
      if parts.length() > 1 {
        match Int::parse(parts[1].trim()) {
          Some(n) => tokens.push(Number(n))
          None => {}
        }
      }
    } else if trimmed.starts_with("say") {
      tokens.push(Say)
      // extract string inside ""
      let start = trimmed.index_of('"')
      let end = trimmed.last_index_of('"')
      if start != -1 && end != -1 && end > start {
        let s = trimmed.substring(start + 1, end)
        tokens.push(StringLit(s))
      }
    } else if trimmed.starts_with("end") {
      tokens.push(End)
    }
  }
  tokens.push(Eof)
  tokens
}
