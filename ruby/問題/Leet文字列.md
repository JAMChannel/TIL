str = gets.chomp.split('')
@item = []
str.each do |s|
  case s
  when 'A'
    @item << 4
    # puts '4'
  when 'E'
    @item << 3
    # puts '3'
  when 'G'
    @item << 6
    # puts '6'
  when 'I'
    @item << 1
    # puts '1'
  when 'O'
    @item << 0
    # puts '0'
  when 'S'
    @item << 5
    # puts '5'
  when 'Z'
    @item << 2
    # puts '2'
  else
    @item << s
    # puts s
  end
end

puts @item.join