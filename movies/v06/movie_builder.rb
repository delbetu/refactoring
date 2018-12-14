class MovieBuilder
  attr_accessor :title, :price_code

  def initialize
    @title = 'movie_name';
  end

  def with_title(title)
    self.title = title;
    return self;
  end

  def with_price_code(price_code)
    self.price_code = price_code;
    return self;
  end

  def build
    Movie.new(title, price_code);
  end
end
