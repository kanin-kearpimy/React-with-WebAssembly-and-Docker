import { useState } from 'react';
import myModule from './wasm/my-module'
import './App.css';

function App() {
  const [text, setText] = useState<string>();
  let wasm: any;

  myModule().then((module: any) => {
    wasm = module
    module.sayHello();
  })
  
  return (
    <div className="App">
      <header className="App-header">
        <h2>This is React and WebAssembly containerized by Docker.</h2>
        <button onClick={() => setText(wasm.helloWasm())}>Hello WASM</button>
        <h4>{text}</h4>
      </header>
    </div>
  );
}

export default App;
