require_relative 'bike'
require_relative 'garage'
require_relative 'van'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'DockingStation empty' if empty?
    fail 'Bike is broken' if bikes.last.working? == false
    @bikes.pop
  end

  def dock(bike)
    fail 'DockingStation full' if full?
    @bikes << bike
  end

  def remove_broken_bikes
      @broken_bikes = @bikes.select { |bike| bike.working? == false  }
      remove_broken_bikes_from_dock
    end

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

  def remove_broken_bikes_from_dock
   @bikes = @bikes.reject { |bike| bike.working? == false }
 end


end
