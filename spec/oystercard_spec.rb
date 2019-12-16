require 'oystercard'

describe Oystercard do

  it 'responds to instance of oystercard' do
  oystercard = Oystercard.new
  expect(oystercard).to be_kind_of(Oystercard)
  end
  
  it 'responds to balance' do
  oystercard = Oystercard.new
  expect(oystercard).to respond_to(:balance)
  end

end