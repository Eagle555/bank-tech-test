require_relative "account"
   
class Bank

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
        statement
    end
  end

  def deposit(*amount)
    if amount.first.nil? 
      puts "How much would like to deposit"
      amount = gets.chomp.to_f 
    else
      amount = amount.first
    end
    account.pay_in(amount)
  end

  def withdraw(*amount)
    if amount.first.nil?
      puts "How much would you like to withdraw?"
      amount = gets.chomp.to_f
    else
      amount = amount.first
    end
    account.pay_out(amount)
  end

  def show
    puts "You have #{account.current_balance} pounds in your account"
  end

  def statement
    account.transactions
    puts "Current balance: #{account.current_balance} pounds"
  end

  private

  attr_reader :account

  def initialize
    @account = Account.new
  end

end