require 'minitest/autorun'
require 'byebug'
require_relative 'price'
require_relative 'movie'
require_relative 'movie_builder'
require_relative 'rental'
require_relative 'rental_builder'
require_relative 'customer'
require_relative 'customer_builder'
require_relative 'statement_builder'

class CustomerTest < Minitest::Test
  def test_without_rentals
    customer_name = 'customer_name'
    customer = CustomerBuilder.new.with_name(customer_name).build
    statement = customer.statement
    result = StatementBuilder.new.with_customer_name(customer_name)
      .with_total_amount(0).with_frequent_renter_points(0).build
    assert_equal(result, statement)
  end

  def test_regular_rental1_day
    movie_name = 'movie_name'
    movie = MovieBuilder.new.with_title(movie_name).with_regular_price.build
    rental = RentalBuilder.new(movie).with_days_rented(1).build
    customer_name = 'customer_name'
    customer = CustomerBuilder.new.with_name(customer_name).with_rental(rental).build
    statement = customer.statement
    result = StatementBuilder.new.with_customer_name(customer_name).with_movie(movie_name, 2)
      .with_total_amount(2).with_frequent_renter_points(1).build
    assert_equal(result, statement)
  end

  def test_regular_rental2_day
    movie_name = 'movie_name'
    movie = MovieBuilder.new.with_title(movie_name).with_regular_price.build
    rental = RentalBuilder.new(movie).with_days_rented(2).build
    customer_name = 'customer_name'
    customer = CustomerBuilder.new.with_name(customer_name).with_rental(rental).build
    statement = customer.statement
    result = StatementBuilder.new.with_customer_name(customer_name).with_movie(movie_name, 2)
      .with_total_amount(2).with_frequent_renter_points(1).build
    assert_equal(result, statement)
  end

  def test_regular_rental3_day
    movie_name = 'movie_name'
    movie = MovieBuilder.new.with_title(movie_name).with_regular_price.build
    rental = RentalBuilder.new(movie).with_days_rented(3).build
    customer_name = 'customer_name'
    customer = CustomerBuilder.new.with_name(customer_name).with_rental(rental).build
    statement = customer.statement
    result = StatementBuilder.new.with_customer_name(customer_name).with_movie(movie_name, 3.5)
      .with_total_amount(3.5).with_frequent_renter_points(1).build
    assert_equal(result, statement)
  end


  def test_newreleaserental1_day
    movie_name = 'movie_name'
    movie = MovieBuilder.new.with_title(movie_name).with_new_release_price.build
    rental = RentalBuilder.new(movie).with_days_rented(1).build
    customer_name = 'customer_name'
    customer = CustomerBuilder.new.with_name(customer_name).with_rental(rental).build
    statement = customer.statement
    result = StatementBuilder.new.with_customer_name(customer_name).with_movie(movie_name, 3)
      .with_total_amount(3).with_frequent_renter_points(1).build
    assert_equal(result, statement)
  end

  def test_newreleaserental2_day
    movie_name = 'movie_name'
    movie = MovieBuilder.new.with_title(movie_name).with_new_release_price.build
    rental = RentalBuilder.new(movie).with_days_rented(2).build
    customer_name = 'customer_name'
    customer = CustomerBuilder.new.with_name(customer_name).with_rental(rental).build
    statement = customer.statement
    result = StatementBuilder.new.with_customer_name(customer_name).with_movie(movie_name, 3)
      .with_total_amount(3).with_frequent_renter_points(2).build
    assert_equal(result, statement)
  end


  def test_newrelease_rental3_day
    movie_name = 'movie_name'
    movie = MovieBuilder.new.with_title(movie_name).with_new_release_price.build
    rental = RentalBuilder.new(movie).with_days_rented(3).build
    customer_name = 'customer_name'
    customer = CustomerBuilder.new.with_name(customer_name).with_rental(rental).build
    statement = customer.statement
    result = StatementBuilder.new.with_customer_name(customer_name).with_movie(movie_name, 3)
      .with_total_amount(3).with_frequent_renter_points(2).build
    assert_equal(result, statement)
  end

  def test_childrens_rental1_day
    movie_name = 'movie_name'
    movie = MovieBuilder.new.with_title(movie_name).with_children_price.build
    rental = RentalBuilder.new(movie).with_days_rented(1).build
    customer_name = 'customer_name'
    customer = CustomerBuilder.new.with_name(customer_name).with_rental(rental).build
    statement = customer.statement
    result = StatementBuilder.new.with_customer_name(customer_name).with_movie(movie_name, 1.5)
      .with_total_amount(1.5).with_frequent_renter_points(1).build
    assert_equal(result, statement)
  end

  def test_childrensrental3_day
    movie_name = 'movie_name'
    movie = MovieBuilder.new.with_title(movie_name).with_children_price.build
    rental = RentalBuilder.new(movie).with_days_rented(3).build
    customer_name = 'customer_name'
    customer = CustomerBuilder.new.with_name(customer_name).with_rental(rental).build
    statement = customer.statement
    result = StatementBuilder.new.with_customer_name(customer_name).with_movie(movie_name, 1.5)
      .with_total_amount(1.5).with_frequent_renter_points(1).build
    assert_equal(result, statement)
  end

  def test_childrens_rental4_day
    movie_name = 'movie_name'
    movie = MovieBuilder.new.with_title(movie_name).with_children_price.build
    rental = RentalBuilder.new(movie).with_days_rented(4).build
    customer_name = 'customer_name'
    customer = CustomerBuilder.new.with_name(customer_name).with_rental(rental).build
    statement = customer.statement
    result = StatementBuilder.new.with_customer_name(customer_name).with_movie(movie_name, 6.0)
      .with_total_amount(6.0).with_frequent_renter_points(1).build
    assert_equal(result, statement)
  end

  def test_rental
    regular_movie_name = 'regular_movie_name'
    regular_movie = MovieBuilder.new.with_title(regular_movie_name).with_regular_price.build
    regular_rental = RentalBuilder.new(regular_movie).with_days_rented(10).build

    new_release_movie_name = 'new_release_movie_name'
    new_release_movie = MovieBuilder.new.with_title(new_release_movie_name).with_new_release_price.build
    new_release_rental = RentalBuilder.new(new_release_movie).with_days_rented(10).build

    childrens_movie_name = 'childrens_movie_name'
    childrens_movie = MovieBuilder.new.with_title(childrens_movie_name).with_children_price.build
    childrens_rental = RentalBuilder.new(childrens_movie).with_days_rented(10).build

    customer_name = 'customer_name'
    customer = CustomerBuilder.new.with_name(customer_name)
      .with_rental(regular_rental).with_rental(new_release_rental).with_rental(childrens_rental).build
    statement = customer.statement
    result = StatementBuilder.new.with_customer_name(customer_name)
      .with_movie(regular_movie_name, 14.0).with_movie(new_release_movie_name, 3).with_movie(childrens_movie_name, 15.0)
      .with_total_amount(32.0).with_frequent_renter_points(4).build
    assert_equal(result, statement)
  end
end
