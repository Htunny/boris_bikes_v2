require 'docking_station'

describe DockingStation do

  subject(:docking_station) { described_class.new }
  let(:bike) { double(:bike, :working? => true) }

describe '#initializing docking station' do
  it 'allows user to set capacity when initializing docking station ' do
    expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'initilizes with a capacity of 20 if no new capacity is given' do
    expect(docking_station.capacity).to eq 20
  end
end

describe '#releasing a bike' do
  it 'responds to release_bike' do
    subject.dock(bike)
    expect(docking_station).to respond_to(:release_bike)
  end

  it 'raises error if there are no bikes in docking station' do
    expect{subject.release_bike}.to raise_error("There are no bikes available")
  end

  it 'expects bike to be working' do
    docking_station.dock(bike)
    docking_station.release_bike
    expect(bike).to be_working
  end

  it 'raises error if bike is broken' do
    bike = double(:bike, working?: false)
    docking_station.dock(bike)
    expect{docking_station.release_bike}.to raise_error("Bike is broken")
  end
end

describe '#docking a bike' do
  it 'raises an error when full' do
     docking_station.capacity.times do subject.dock(bike) end
     expect { docking_station.dock(bike) }.to raise_error 'Docking station has reached capacity'
  end

  it 'raises error when full with new default capacity' do
    docking_station = DockingStation.new(50)
    50.times { docking_station.dock(bike) }
    expect{ docking_station.dock(bike) }.to raise_error 'Docking station has reached capacity'
  end

  it 'docks a bike' do
    expect(docking_station.dock(bike)).to eq [bike]
  end
end

  it { is_expected.to respond_to(:dock).with(1).argument }


end
