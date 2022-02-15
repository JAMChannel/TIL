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