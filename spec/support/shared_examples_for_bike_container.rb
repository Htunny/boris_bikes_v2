require 'bike_container'

shared_examples_for BikeContainer do
  it 'has a default capacity when initialized' do
    expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end

  describe 'capacity' do
  it 'can be overridden on initialize' do
    random_capacity = Random.rand(100)
    subject = described_class.new random_capacity
    expect(subject.capacity).to eq random_capacity
   end
  end

  describe 'add_bike' do
    it 'receives a bike' do
      subject.dock double :bike
      expect(subject).not_to be_empty
     end

    it 'raises an error when full' do
      subject.capacity.times { subject.dock double(:bike) }
      expect { subject.dock double(:bike) }.to raise_error "#{described_class.name} full"
    end
   end

   describe 'remove_bike' do
      let(:bike) { Bike.new }
      before(:each) { subject.dock bike }

  it 'returns a bike' do
    expect(subject.release_bike).to eq bike
  end

  it 'removes the bike from the collection' do
    subject.release_bike
    expect(subject).to be_empty
  end

  it 'raises an error when empty' do
    subject.release_bike
    expect { subject.release_bike }.to raise_error "#{described_class.name} empty"
  end
end
end
