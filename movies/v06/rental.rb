# Code smell feature envy --> switch is interested on movie.price_code
# Move get_charge to Movie
# Code smell feature envy --> get_frequent_renter_points is interested in movie.price_code
# Move get_frequent_renter_points to Movie
class Rental
	attr_accessor :movie, :days_rented

	def initialize(movie, days_rented)
		@movie = movie
		@days_rented = days_rented
	end

  def get_charge
    movie.get_charge(days_rented)
  end

  def get_frequent_renter_points
    movie.get_frequent_renter_points(days_rented)
  end
end
