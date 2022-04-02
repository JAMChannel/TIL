```
money, discount = gets.split(" ").map(&:to_i)
# puts money
# puts discount

def calculation(discount)
  discount.to_f / 100.to_f
end
total = money

while money > 0 do
    # debugger
  money = (money - (money * calculation(discount))).floor
  total += money
  # puts money
  # puts total
end
puts total
```

## untilを利用する場合
```
# until money == 0
#   money = (money - (money * calculation(discount))).floor
#   total += money
#   puts money
#   puts total
# end
# puts total
```