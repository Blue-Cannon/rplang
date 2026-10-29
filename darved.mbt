// darved.mbt - dar package manager operations

pub fn dar_init() -> Unit {
  println("dar: initializing new RPLang project...")
  // creates Darved.toml, main.rpl, .gitignore
}

pub fn dar_add(package_name : String) -> Unit {
  println("dar: adding \{package_name} to Darved.toml")
  // 1. read Darved.toml
  // 2. add dependency
  // 3. run dar_install
}

pub fn dar_install() -> Unit {
  println("dar: installing dependencies from Darved.toml")
  // downloads packages to .darved/
}

pub fn dar_remove(package_name : String) -> Unit {
  println("dar: removing \{package_name}")
}

pub fn dar_run(file : String) -> Unit {
  println("dar: running \{file} on Gengine Ramos VM")
  // calls GRVM
}

pub fn dar_build() -> Unit {
  println("dar: building to wasm via MoonBit")
}

pub fn dar_help() -> Unit {
  println(
    #|Usage: dar <operation> <package-name>
    #|  dar init              - create new project
    #|  dar add <pkg>         - add package
    #|  dar install           - install deps
    #|  dar remove <pkg>      - remove package
    #|  dar run <file>        - run file on GRVM
    #|  dar build             - build to wasm
  )
}
