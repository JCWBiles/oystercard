class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @balance = @balance + (amount)
    #  @balance += amount
  end

end

