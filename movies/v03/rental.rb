class Rental
	attr_accessor :movie, :days_rented

	def initialize(movie, days_rented)
		@movie = movie
		@days_rented = days_rented
	end

  def get_charge
    this_amount = 0
    case (movie.price_code)
    when Movie::REGULAR
      this_amount += 2
      if (days_rented > 2)
        this_amount += (days_rented - 2) * 1.5
      end
    when Movie::NEW_RELEASE
      this_amount += 3
    when Movie::CHILDRENS
      this_amount += 1.5
      if (days_rented > 3)
        this_amount += (days_rented - 1) * 1.5
      end
    end
    this_amount
  end
end
