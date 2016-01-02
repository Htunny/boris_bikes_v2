require 'bike'

describe Bike do

  subject(:bike) { described_class.new }

  it 'responds to working?' do
  expect(bike).to respond_to :working?
 end

 it 'reports a bike as broken' do
   bike.report_broken
   expect(bike.working?).to eq false
 end

end
