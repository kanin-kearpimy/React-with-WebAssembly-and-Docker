import wasmModule from './wasm/dist/my-module';
import './App.css';


function App() {
  let wasm
  wasmModule().then((output: any) => wasm = output)
  return (
    <div className="App">
      <header className="App-header">
        <h1>Docker Wasm Builder.</h1>
      </header>
    </div>
  );
}

export default App;
