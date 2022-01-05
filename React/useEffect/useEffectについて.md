##　useEffect練習
最初にレンダリングもしくは変更されたとき

```
import React,{ useState,useEffect } from 'react'
import './App.css';

function App() {
  const [count, setCount] = useState(0);
  useEffect(() => {
    // effect
    console.log(count)
  }, [count])

  return (
    <div>
      <p>your click {count} times.</p>
      <button onClick={() => setCount(count + 1)}>
        onClick
      </button>
    </div>
  )
}

export default App
```

第二引数がへ変わったときconsole.log（中身の処理が行われる）