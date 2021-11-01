

def fizz_buzz(n)
    if n % 15 == 0 # 15は３でも割り切れるので先頭
      "fizz buzz"
    elsif n % 3 == 0  # ３で割り切れるということは値が０で割り切れればtrue
      "Fizz"
    elsif n % 5 == 0  # ５で割り切れる場合出力
      "buzz"
    else
      n.to_s
    end
end


number = gets.to_i


(1..number).each do |num|
  puts fizz_buzz(num)
end


