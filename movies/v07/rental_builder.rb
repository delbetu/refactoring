class RentalBuilder
  attr_accessor  :movie, :days_rented

  def initialize(movie)
    @movie = movie
    self
  end

  def with_days_rented(days_rented)
    self.days_rented = days_rented
    self
  end

  def build
    Rental.new(movie, days_rented)
  end
end
