# クラスでデータを管理する


### インスタンス変数とは
インスタンス変数は、実体化したインスタンスが持つ変数です。インスタンス変数は、インスタンスがある限りデータが保持されます。
インスタンス変数は、変数名の先頭に「@」を付けます。

### アクセサの種類
@jobをオブジェクト外から読み書きする


##### 読み出しと書き込みの両方
attr_accessor :job
また、次のようにすると、読み出しのみ、書き込みのみも指定できます。

##### 読み出しのみ
attr_reader :job

##### 書き込みのみ
attr_writer :job



```
class Player
    # 読み出しと書き込みの両方
    attr_accessor :job
    def initialize(job)
        @job = job
    end
    # def initialize(job) # 初期化メソッド
    #     @job = job
    # end

    def walk()
        puts "#{@job}は、荒野を歩いていた。"
    end
end


player1 = Player.new("戦士")

player1.walk

player2 = Player.new("魔法")
player1.walk

player1.job = "勇者"
player1.walk
```