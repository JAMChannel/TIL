# ハッシュの整列

```
items = {"イージスシールド" => 40, "ウィンドスピア" =>12, "アースブレイカー" =>99}
p items.sort

p items.sort.to_h

# バリューのsort
p items.sort_by {|k, v| v }
p items.sort_by {|k, v| v }.to_h

```