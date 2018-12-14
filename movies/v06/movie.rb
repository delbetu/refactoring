class Movie
	REGULAR = 0
	NEW_RELEASE = 1
	CHILDRENS = 2

  attr_accessor  :title, :price_code

	def initialize(title, price_code)
		@title = title
		@price_code = price_code
	end

  def get_charge(days_rented)
    this_amount = 0
    case (price_code)
    when REGULAR
      this_amount += 2
      if (days_rented > 2)
        this_amount += (days_rented - 2) * 1.5
      end
    when NEW_RELEASE
      this_amount += 3
    when CHILDRENS
      this_amount += 1.5
      if (days_rented > 3)
        this_amount += (days_rented - 1) * 1.5
      end
    end
    this_amount
  end

  def get_frequent_renter_points(days_rented)
    result = 1
    # add bonus for a two day new release rental
    if ((price_code == NEW_RELEASE) && days_rented > 1)
      result += 1
    end
    result
  end
end
