# umeda = Gate.new(:umeda)
# mikuni = Gate.new(:mikuni)

# ticket = Ticket.new(150)
# umeda.enter(ticket)
# mikuni.exit(ticket)

class User
  def initialize

    puts "イニシャライズできた？？"
  end

  def hello
    puts "Hello!"
  end
  
end

User.new
User.hello

