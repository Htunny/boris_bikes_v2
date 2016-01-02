require 'docking_station'

describe DockingStation do

  subject(:docking_station) { described_class.new }

  it 'responds to release_bike' do
    expect(docking_station).to respond_to(:release_bike)
  end

  it 'expects bike to be working' do
    bike = docking_station.release_bike
    expect(bike).to be_working
  end

end
