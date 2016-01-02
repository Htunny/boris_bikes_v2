require 'docking_station'

describe DockingStation do

  subject(:docking_station) { described_class.new }

  it 'responds to release_bike' do
    expect(docking_station).to respond_to(:release_bike)
  end

  it 'expects bike to be working' do
    bike = Bike.new
    subject.dock(bike)
    bike = docking_station.release_bike
    expect(bike).to be_working
  end

  it 'docks a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(docking_station.dock(bike)).to eq bike
  end

  it 'raises error if there are no bikes in docking station' do
    expect{docking_station.release_bike}.to raise_error("There are no bikes available")
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

end
