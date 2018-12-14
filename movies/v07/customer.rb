class Customer
  attr_accessor :name, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(rental)
    rentals << rental
  end

  def statement
    result = 'Rental Record for ' + name + "\n"
    rentals.each do |rental|
      # show figures for this rental
      result += "\t" + rental.movie.title + "\t" + rental.get_charge.to_s + "\n"
    end

    # add footer lines
    result += 'Amount owed is ' + total_charge.to_s + "\n"
    result += 'You earned ' + total_frequent_renter_points.to_s + ' frequent renter points'
    result
  end

  def total_charge
    result = 0
    rentals.each do |rental|
      result += rental.get_charge
    end
    result
  end

  def total_frequent_renter_points
    result = 0
    rentals.each do |rental|
      result += rental.get_frequent_renter_points
    end
    result
  end
end
