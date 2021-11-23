# frozen_string_literal: true

require_relative 'balance'

class Account
  def transactions
    if ledger.empty?
      puts 'No transactions yet'
    else
      ledger.each do |transaction|
        puts "Amount: #{transaction.first}, Date: #{transaction[1]}, Type: #{transaction.last}"
      end
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
    if ledger.last.first == amount && amount > 0.01
      balance_verification(amount, type)
    else
      puts 'Error: transaction not recorded'
    end
  end

  def balance_verification(amount, type)
    if type
      if balance.add_and_verify(amount)
        puts "You have now #{balance.show_balance} pounds in your account"
      else
        puts "Transaction unsuccessful, current balance: #{balance.show_balance} pounds"
        ledger.last << 'deposit - operation cancelled'
      end
    elsif balance.deduct_and_verify(amount)
      puts "You have now #{balance.show_balance} pounds in your account"
    else
      puts "Transaction unsuccessful, current balance: #{balance.show_balance} pounds"
      ledger.last << 'withdrawal - operation cancelled'
    end
  end

  def transaction_payin(amount)
    ledger << [amount, Time.now, :deposit]
    operation_cancellation(amount)
  end

  def transaction_payout(amount)
    ledger << [amount, Time.now, :withdrawal]
    operation_cancellation(amount)
  end

  def operation_cancellation(amount)
    ledger.last << 'activity reported to bank - operation cancelled' unless amount > 0.01 && amount.is_a?(Numeric)
  end

  protected

  attr_reader :ledger, :balance

  def initialize
    @balance = Balance.new
    @ledger = []
  end
end
