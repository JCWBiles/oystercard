class Oystercard

  attr_reader :balance, :entry_station

  LIMIT = 90
  MINIMUM = 1
  CHARGE = 1

  def initialize
    @balance = 0
    @journey = false
    @entry_station
  end

  def top_up(amount)
    fail "Max Limit of #{LIMIT} Exceeded" if @balance + amount > LIMIT
    @balance = @balance + (amount)
    #  @balance += amount
  end

  def in_journey?
    @journey
  end

  def touch_in(station)
    fail "The #{MINIMUM} minimum is not on card before touch in" if @balance < MINIMUM
    @entry_station = station
    @journey = true
  end

  def touch_out
    @journey = false
    deduct(CHARGE)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance = @balance - (amount)
  end


end

