require 'docking_station'

describe DockingStation do

  subject(:docking_station) { described_class.new }

describe '#releasing a bike' do
  it 'responds to release_bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(docking_station).to respond_to(:release_bike)
  end

  it 'raises error if there are no bikes in docking station' do
    expect{subject.release_bike}.to raise_error("There are no bikes available")
  end

  it 'expects bike to be working' do
    bike = Bike.new
    docking_station.dock(bike)
    docking_station.release_bike
    expect(bike).to be_working
  end
end

describe '#docking a bike' do
  it 'raises an error when full' do
     bike = Bike.new
     20.times { subject.dock(bike) }
     expect { docking_station.dock(bike) }.to raise_error 'Docking station has reached capacity'
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(docking_station.dock(bike)).to eq [bike]
  end
end

  it { is_expected.to respond_to(:dock).with(1).argument }


end
