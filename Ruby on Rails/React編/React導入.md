## rails new

```
rails _6.0.0_ new アプリケーション名 -d mysql --skip-coffee --skip-turbolinks --webpack=react
rails webpacker:install:react
rails g react:install
yarn add react-router-dom axios styled-components react-icons react-toastify
```

## .html.erb
```
<%= javascript_pack_tag 'index' %>

<h1 class="display-4 text-primary">React#index</h1>
<div id="index"></div>
```

## index.jsxに変更
```
index.jsx
```

index.jsx
```
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
// import reportWebVitals from './reportWebVitals';


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <React.StrictMode>
    <App />
    </React.StrictMode>,
    // document.body.appendChild(document.createElement('div')),
    document.getElementById('index')
  );
})


// reportWebVitals(console.log);
```

App.js
```
import React from 'react';
import logo from './logo.svg';

function App() {
  return (
    <div className="App">
      <div className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
      </div>
    </div>
  )

}

export default App;
```








