## 今日やること

> ポートフォリオ
- ユーザー管理ページ追加
- ヒートマップカレンダー（Reactタイムライン側追加）



> 面接対策
- 資料作成
- 洗い出し


> paiza
- 練習問題一個（A達成できる様に時間確保）

> Ruby
Rspecと連携させて問題を解く練習をする
実行するたびに問題があっているか確認！！
```
require_relative '../src/create_daily_bar_service'

describe CreateDailyBarService do
  let(:prices) do 
    [
      ['銘柄コード', '時刻', '株価'],
      ['4436', '2021-3-10 10:00', 3585],
      ['4436', '2021-3-10 09:00', 3605],
      ['4436', '2021-3-10 11:00', 3505],
      ['4436', '2021-3-10 14:00', 3655],
      ['4436', '2021-3-10 15:00', 3635],
      ['4436', '2021-3-10 13:00', 3555]
    ]
  end

  subject(:daily_bar) { CreateDailyBarService.new(prices).call }

  it '銘柄コード' do
    expect(daily_bar.code).to eq('4436')
  end

  it '日付' do
    expect(daily_bar.date).to eq(Date.new(2021,3,10))
  end

  it '始値' do
    expect(daily_bar.open).to eq(3605)
  end
```

> SQL
- sqlzoo

> React
- 計算算出


> 業務委託
- なし


##その他
数日プログラミング賢者タイムになっていたので気合いを入れ直す。  
目標まであと少し！！2月中には決めたいところ・・・
