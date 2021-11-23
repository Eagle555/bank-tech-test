require_relative "balance"

class Account

  def transactions
    if ledger.empty?
      puts "No transactions yet" 
    else
      ledger.each { |transaction| puts "Amount: #{transaction.first}, Date: #{transaction[1]}, Type: #{transaction.last}" }
    end
  end

  def current_balance
    balance.show_balance
  end

  def pay_in(amount)
    transaction_payin(amount)
    transaction_verification(amount, true)
    
  end

  def pay_out(amount)
    transaction_payout(amount)
    transaction_verification(amount, false)
  end

  private 

  def transaction_verification(amount, type)
    if ledger.last.first == amount
      balance_verification(amount, type)
    else
      puts "Error: transaction not recorded"
    end
  end

  def balance_verification(amount, type)
    if type
      if balance.add_and_verify(amount)
        puts "You have now #{balance.show_balance} pounds in your account"
      else
        puts "Transaction unsuccessful, current balance: #{balance.show_balance} pounds"
        ledger.last << "deposit - operation cancelled"
      end
    else
      if balance.deduct_and_verify(amount)
        puts "You have now #{balance.show_balance} pounds in your account"
      else
        puts "Transaction unsuccessful, current balance: #{balance.show_balance} pounds"
        ledger.last << "withdrawal - operation cancelled"
      end
    end
  end

  def transaction_payin(amount)
    ledger << [amount, Time.now, :deposit]
  end
  
  def transaction_payout(amount)
    ledger << [amount, Time.now, :withdrawal]
  end

  protected 
  attr_reader :ledger
  attr_reader :balance

  def initialize
    @balance = Balance.new
    @ledger = []
  end

end