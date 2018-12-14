# Smell switch statement
# Replace type code with state/strategy
  # Encapsulate field => Ensure all usages go through get/set methods
  # Create new class for the same purpose of type code and add subclases for each type code
  # Add Price#code method and implement by subclasses
  # Link Movie with new state object by delegating encapsulated field to new state object
# Move get_charge method to Price
# Replace conditional with polymorphism
# Move get_frequent_renter_points method to Price
# Replace conditional with polymorphism
class Movie
	REGULAR = 0
	NEW_RELEASE = 1
	CHILDRENS = 2

  attr_accessor  :title

	def initialize(title, price_code)
		@title = title
    self.price_code = price_code
	end

  def price_code
    @price.code
  end

  def price_code=(price_code)
    @price =
      case (price_code)
      when REGULAR
        RegularPrice.new
      when NEW_RELEASE
        NewReleasePrice.new
      when CHILDRENS
        ChildrenPrice.new
      end
  end

  def get_charge(days_rented)
    @price.get_charge(days_rented)
  end

  def get_frequent_renter_points(days_rented)
    @price.get_frequent_renter_points(days_rented)
  end
end
