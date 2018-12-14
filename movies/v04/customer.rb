# Code smell feature envy.
# Extract frequent_renter_points method.
# frequent_renter_points method is more interested on rental's data than customer's data.
# Move method to rental.
# Rename method frequent_renter_points to get_charge
# Replace temporal variable this_amount with query ( rental.get_charge )
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
    total_amount = 0
    frequent_renter_points = 0
    result = 'Rental Record for ' + name + "\n"
    rentals.each do |rental|
      frequent_renter_points += rental.get_frequent_renter_points

      # show figures for this rental
      result += "\t" + rental.movie.title + "\t" + rental.get_charge.to_s + "\n"
      total_amount += rental.get_charge
    end

    # add footer lines
    result += 'Amount owed is ' + total_amount.to_s + "\n"
    result += 'You earned ' + frequent_renter_points.to_s + ' frequent renter points'
    result
  end
end
