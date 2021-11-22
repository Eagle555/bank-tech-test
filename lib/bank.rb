class Bank
  def initialize
    @bank = 0
    @history = []
  end

  def menu
    loop do
      puts "Enter 1 - deposit"
      puts "Enter 2 - show balance"
      puts "Enter 3 - withdraw"
      puts "Enter 4 - show transactions"
      puts "Write 'exit' to exit"
      choice = gets.chomp
      break if choice == "exit"
      action(choice.to_i)
    end
  end

  def action(choice)
    case choice
      when 1
        deposit
      when 2
        show
      when 3
        withdraw
      when 4
        history
    end
  end

  def deposit
  end

  def withdraw
  end

  def history
  end

  def show
    puts "You have #{@bank} pounds in your account"
  end

end

my_bank = Bank.new
my_bank.menu