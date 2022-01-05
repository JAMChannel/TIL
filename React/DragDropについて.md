
yarn追加
```
npm install react-beautiful-dnd
```


DragDropContext、Draggableを追加

```
import { Draggable } from 'react-beautiful-dnd';
import { DragDropContext } from 'react-beautiful-dnd';
import './App.css';

function App() {
  return (
    <div>
      <DragDropContext>
        <Draggable draggableId='draggable'>

        </Draggable>
      </DragDropContext>
    </div>
  );
}

export default App;

```

- Draggableは関数じゃないとエラーになる
例：<div></div>など
