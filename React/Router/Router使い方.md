index.jsx

```
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import { BrowserRouter } from 'react-router-dom';

ReactDOM.render(
  <React.StrictMode>

    <BrowserRouter>
      <App />
    </BrowserRouter>
  </React.StrictMode>,
  document.getElementById('root')
);
```

App.js
v6からはSwitchは使わない
```
import { Route, Routes } from "react-router"


//Components
import Main from './components/Main';



function App() {
  return <>
   
  <GlobalStyle />
    <ThemeProvider theme={lightTheme}>
      <Routes>
        <Route exact path="/" element={<Main/>}/>
      </Routes>

    </ThemeProvider>
  </>

}

export default App;
```