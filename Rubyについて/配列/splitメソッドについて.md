# 取り込んだデータを配列に格納する
line = gets.chomp.split(",")
p line
puts line.length


line.each do |enemy|
    puts "#{enemy}があらわれた"
end