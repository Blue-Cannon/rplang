// Universal RPLang WASM loader - works with any .wasm from dar build
    let wasmMemory = null;

    // Helper: read string from WASM memory (for say)
    function readString(ptr, len) {
      const bytes = new Uint8Array(wasmMemory.buffer, ptr, len);
      return new TextDecoder().decode(bytes);
    }

    // env.say implementation for RPLang
    function rplang_say(ptr, len) {
      const text = readString(ptr, len);
      console.log(text);
      document.getElementById('output').innerHTML += text + "<br>";
    }

    // Load ANY RPLang WASM file
    async function loadRPLang(wasmFile) {
      console.log(`[GRVM] Loading ${wasmFile}...`);
      
      const imports = {
        env: {
          say: rplang_say,
          // future ops: ask, math, etc.
          memory: new WebAssembly.Memory({ initial: 1 })
        }
      };

      try {
        const result = await WebAssembly.instantiateStreaming(fetch(wasmFile), imports);
        wasmMemory = result.instance.exports.memory;
        
        console.log(`[GRVM] Running ${wasmFile}`);
        // Your RPLang main is exported as "main"
        if (result.instance.exports.main) {
          result.instance.exports.main();
        }
        // Also support "_start" for MoonBit style
        if (result.instance.exports._start) {
          result.instance.exports._start();
        }
        console.log(`[GRVM] Finished ${wasmFile}`);
      } catch (e) {
        console.error(`[GRVM] Failed to load ${wasmFile}:`, e);
      }
    }

    // Load your RPLang programs
    // Change these to any file you built with: dar build
    // loadRPLang('hello.wasm');
    // loadRPLang('myapp.wasm');
    // loadRPLang('examples/test.wasm');
