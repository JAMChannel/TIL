# クラスを作成する

クラス名の先頭は、アルファベットの大文字から始まらないといけません。

```
class Player           # クラス定義
    def walk()
        puts "勇者は、荒野を歩いていた。"
    end
    
    def attack(enemy)
        puts "勇者は、#{enemy}を攻撃した！"
    end
end

player1 = Player.new() 

player1.walk
player1.attack("スライド")
```