class Oystercard
  attr_reader :balance
  LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Max Limit of #{LIMIT} Exceeded" if @balance + amount > LIMIT
    @balance = @balance + (amount)
    #  @balance += amount
  end

end

