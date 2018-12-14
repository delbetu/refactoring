class CustomerBuilder
  attr_accessor :rentals, :name

  def initialize
    @rentals = []
  end

  def with_name(name)
    self.name = name
    self
  end

  def with_rental(rental)
    rentals << rental
    self
  end

  def build
    customer = Customer.new(name)
    rentals.each do |rental|
      customer.add_rental(rental)
    end

     customer
  end
end

