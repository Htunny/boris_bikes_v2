require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'There are no bikes available' if empty?
    fail 'Bike is broken' if bikes.last.working? == false
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station has reached capacity' if full?
    @bikes << bike
  end

  # def remove_broken_bikes
  #     @broken_bikes = @bikes.select { |bike| bike.working? == false  }
  #     remove_broken_bikes_from_dock
  #     @broken_bikes
  #   end

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


 #  def remove_broken_bikes_from_dock
 #   @bikes = @bikes.reject { |bike| bike.working? == false }
 # end


end
