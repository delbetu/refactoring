class StatementBuilder
	attr_accessor :customer_name, :movie_names, :amounts, :total_amount, :frequent_renter_points

	def initialize
    @frequent_renter_points = 0
    @total_amount = 0
		@movie_names = []
		@amounts = []
	end

	def with_customer_name(customer_name)
    self.customer_name = customer_name
    self
	end

	def with_movie(movie_name, amount)
		movie_names << movie_name
		amounts << amount
    self
	end

	def with_total_amount(total_amount)
    self.total_amount = total_amount
    self
	end

	def with_frequent_renter_points(frequent_renter_points)
    self.frequent_renter_points = frequent_renter_points
    self
	end

	def build
		result = "Rental Record for " + customer_name + "\n"
    movie_names.size.times do |i|
      result += "\t" + movie_names[i].to_s + "\t" + amounts[i].to_s + "\n"
		end
    result += "Amount owed is " + total_amount.to_s + "\n"
    result += "You earned " + frequent_renter_points.to_s + " frequent renter points"
		result
	end
end
