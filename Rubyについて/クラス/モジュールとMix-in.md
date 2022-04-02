# Here your code !

```
module Greeting
    def say_hello()
    	puts "hello world"
    end
    
    def say_morning()
        puts "good morning! world"
    end
    
    module_function :say_hello
end

class Player
    include Greeting

    def introduce()
        puts "私は、勇者です。"
    end
end

Greeting.say_hello()

player = Player.new()
player.introduce()
player.say_morning()
```

 - module_functionで読み込まれているものは利用できない

 - モジュール - Ruby入門
http://www.rubylife.jp/ini/module/

- RubyのModuleの使い方とはいったい - Qiita
http://qiita.com/shiopon01/items/fd6803f792398c5219cd

- requireとincludeの違い - Qiita
http://qiita.com/yanap/items/65c3953fb4e52218399a