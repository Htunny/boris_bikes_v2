class Bike

  attr_reader :working, :bikes

  def initialize
    @working = true
  end

  def report_broken
    @working = false
  end

  def working?
    @working
  end

end
