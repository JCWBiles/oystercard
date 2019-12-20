require 'oystercard'

describe Oystercard do

  let(:station){ double :station }

  it 'responds to instance of oystercard' do
    oystercard = Oystercard.new
    expect(oystercard).to be_kind_of(Oystercard)
  end
  
  it 'responds to balance' do
    oystercard = Oystercard.new
    expect(oystercard).to respond_to(:balance)
  end

  it 'responds to method top_up' do
    oystercard = Oystercard.new
    expect(oystercard).to respond_to(:top_up).with(1).argument
  end

  it 'increases the balance by amount provided' do
    oystercard = Oystercard.new
    # oystercard.top_up(5)
    # expect(oystercard.balance).to eq(5)
    expect{ oystercard.top_up 5 }.to change{ oystercard.balance }.by 5
  end

  it 'raises an error if limit is exceeded' do
    oystercard = Oystercard.new
    limit = Oystercard::LIMIT
    oystercard.top_up (limit)
    expect{ oystercard.top_up(1) }.to raise_error "Max Limit of #{limit} Exceeded"
  end

  # it 'repsonds to methood deduct' do
  #   oystercard = Oystercard.new
  #   expect(oystercard).to respond_to(:deduct).with(1).argument
  # end

  # it 'decreases the balance by amount provided' do
  #   oystercard = Oystercard.new
  #   oystercard.top_up(20)
  #   expect{ subject.deduct 3}.to change{ subject.balance }.by -3
  #   # oystercard.deduct(-5)
  #   # expect(oystercard.balance).to eq(5)
  # end

  it 'acknowledges if oystercard is in journey or not' do
    expect(subject).to_not be_in_journey
  end

  it 'responds to touch_in' do
    subject.top_up(5)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  it 'responds to touch_out' do
    subject.top_up(5)
    subject.touch_in(station)
    subject.touch_out
    expect(subject).to_not be_in_journey
  end

  it 'raises an error if minimum is not on card before touch_in' do
    minimum = Oystercard::MINIMUM
    expect{ subject.touch_in(station) }.to raise_error "The #{minimum} minimum is not on card before touch in"
  end

  it 'decreases the balance after touch_out' do
    charge = Oystercard::CHARGE
    subject.top_up(5)
    subject.touch_in(station)
    expect { subject.touch_out }.to change{ subject.balance }.by(-charge)
  end

  it 'remembers station after touch_in' do
    subject.top_up(5)
    subject.touch_in(station)
    expect(subject.entry_station).to eq (station)
  end

  it 'forgets entry_station on touch_out' do
    subject.top_up(5)
    subject.touch_in(station)
    subject.touch_out
    expect(subject.entry_station).to eq (nil)
  end

end