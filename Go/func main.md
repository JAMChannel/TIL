```
package main

import (
    "fmt"
)

func bazz() {
    fmt.Println("buzzz")
}

func main() {
    bazz()
    fmt.Println("Hello, World!")
}
func init() {
    fmt.Println("!!!")
}
```

## 呼ばれる順番
init→main

### 結果
```
!!!
buzzz
Hello, World!
```