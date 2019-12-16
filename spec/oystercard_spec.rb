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

  it 'responds to method top_up' do
  oystercard = Oystercard.new
  expect(oystercard).to respond_to(:top_up).with(1).argument
  end

  it 'increases the balance by amount provided' do
  oystercard = Oystercard.new
  oystercard.top_up(5)
  expect(oystercard.balance).to eq(5)
  # expect{ oystercard.top_up 5 }.to change{ oystercard.balance }.by 5
  end

  it 'raises an error if limit is exceeded' do
  oystercard = Oystercard.new
  limit = Oystercard::LIMIT
  oystercard.top_up (limit)
  expect{ oystercard.top_up(1) }.to raise_error "Max Limit of #{limit} Exceeded"
  end

end