## Array.prototype.map()
map() メソッドは、与えられた関数を配列のすべての要素に対して呼び出し、その結果からなる新しい配列を生成します。


```
const array1 = [1, 4, 9, 16];

// pass a function to map
const map1 = array1.map(x => x * 2);

console.log(map1);
// expected output: Array [2, 8, 18, 32]

```

Reactの場合
```
function Skills() {

  const list = [1, 2, 3, 4];
  const dataList = [
    {
      name: "taro",
      age: 21
    },
    {
      name: "ziro",
      age: 30
    }
  ];
  return (
    <div>
      {list.map((number) => (
        <div>{number * 2}</div>
      ))}
      {dataList.map((data) => (
        <div>
          {data.name}
          <span>{data.age}</span>
        </div>
      ))}
    </div>
  )
}

export default Skills
```