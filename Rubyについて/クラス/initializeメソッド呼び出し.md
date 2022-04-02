# クラスを継承する

```
class Box
    def initialize(item)
        @item = item
    end
    
    def open()
        puts "宝箱を開いた。#{@item}を手に入れた"
    end
end

class JewelryBox < Box
    def look()
        puts "宝箱はキラキラと輝いている。"
    end
end

box = Box.new("洞鉄の件")
box.open



jb = JewelryBox.new("指輪")
puts jb.look()
puts jb.open()

```

# RPGのPlayerクラスを継承で記述する

class Player
    def initialize(name)
        @name = name
    end
    
    def attack(enemy)
        puts "#{@name}は,#{enemy}を攻撃した！"
    end
end

puts "=== パーティでスライムと戦う ==="
hero = Player.new("勇者")
warrior = Player.new("戦士")
party = [hero, warrior]

# p party
party.each do |player|
    player.attack("スライム")
end