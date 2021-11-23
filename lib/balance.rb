class Balance

  def add_and_verify(amount)
    current_credit = credit
    add_credit(amount)
    compare_credit = credit - amount
    compare_credit.round(2)  == current_credit ? true : deduct_credit(amount)
  end

  def deduct_and_verify(amount)
    current_credit = credit
    if deduct_credit(amount)
      compare_credit = credit + amount
      compare_credit.round(2) == current_credit ? true : add_credit(amount)
    else
     false
    end
  end

  def show_balance
    credit
  end
  
  private 

  def add_credit(amount)
    @credit += amount
    @credit = @credit.round(2)
  end

  def deduct_credit(amount)
    if amount <= @credit
      @credit -= amount
      @credit = @credit.round(2)
    else
      false
    end
  end
  
  protected
  attr_reader :credit

  def initialize
    @credit = 0
  end

end