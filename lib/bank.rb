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

  def deposit(*amount)
    puts "How much would like to deposit"
    amount.first.nil? ? amount = gets.chomp.to_i : amount = amount.first
    @bank += amount
    history_payin(amount)
    puts "You have now #{@bank} pounds in your account"
  end

  def withdraw(*amount)
    puts "How much would you like to withdraw?"
    amount.first.nil? ? amount = gets.chomp.to_i : amount = amount.first
    if amount > @bank
      puts "No enough pounds. You have only #{@bank}"
    else
      @bank -= amount
      history_payout(amount)
      puts "You have now #{@bank} pounds in your account"
    end
  end

  def history
    if @history.empty?
      puts "bank empty" 
    else
      @history.each { |transaction| puts "Amount: #{transaction.first}, Date: #{transaction[1]}, Type: #{transaction.last}" }
    end
  end

  def show
    puts "You have #{@bank} pounds in your account"
  end

  private 

  def history_payin(amount)
    @history << [amount, Time.now, :deposit]
  end
  
  def history_payout(amount)
    @history << [amount, Time.now, :withdrawal]
  end

end

my_bank = Bank.new
my_bank.menu