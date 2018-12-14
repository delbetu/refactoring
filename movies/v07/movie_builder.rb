class MovieBuilder
  attr_accessor :title, :price_code

  def initialize
    @title = 'movie_name';
  end

  def with_title(title)
    self.title = title;
    return self;
  end

  def with_regular_price
    self.price_code = Price::REGULAR;
    return self;
  end

  def with_children_price
    self.price_code = Price::CHILDRENS;
    return self;
  end

  def with_new_release_price
    self.price_code = Price::NEW_RELEASE;
    return self;
  end

  def build
    Movie.new(title, price_code);
  end
end
