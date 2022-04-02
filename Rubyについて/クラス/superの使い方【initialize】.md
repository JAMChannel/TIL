# クラスからメソッドを呼び出す
```
class Player
    def initialize(name)
        @name = name
    end

    def attack(enemy)
        puts "#{@name}は、#{enemy}を攻撃した！"
    end
end

class Wizard < Player
    def initialize()
        # @name = "魔法使い"
        super("魔法使い")
    end
    def attack(enemy)
        spell()
        puts "#{@name}は、#{enemy}に炎を放った！"
    end
    
    private
    def spell()
        puts "シャラララーン！"
    end
end


puts "=== パーティでスライムと戦う ==="
hero   = Player.new("勇者")
warrior = Player.new("戦士")
wizard = Wizard.new()
party = [hero, warrior, wizard]

party.each do |player|
    player.attack("スライム")
end

# wizard.spell()
```