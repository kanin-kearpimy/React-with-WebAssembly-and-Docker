import { useEffect } from 'react';
import myModule from './wasm/dist/my-module'
import './App.css';

function App() {
  useEffect(() => {
    myModule().then((output: any) => {
      console.log(output.plus(5, 10))
    })
  }, [])

  
  return (
    <div className="App">
      <header className="App-header">
        <h1>Docker Wasm Builder.</h1>
      </header>
    </div>
  );
}

export default App;
