require_relative 'bike'

class DockingStation

  MAXIMUM_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity=MAXIMUM_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'There are no bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station has reached capacity' if full?
    @bikes << bike
  end

private

  def empty?
    @bikes.empty?
  end

  def full?
    if @bikes.length >= capacity
      return true
    else
      return false
    end
  end


end
