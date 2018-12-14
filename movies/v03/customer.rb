# Code smell feature envy.
# amount_for method is more interested on rental's data than customer's data.
# Move method to rental.
# Rename method amount_for to get_charge
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
      # add frequent renter points
      frequent_renter_points += 1

      # add bonus for a two day new release rental
      if ((rental.movie.price_code == Movie::NEW_RELEASE) && rental.days_rented > 1)
        frequent_renter_points += 1
      end

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
