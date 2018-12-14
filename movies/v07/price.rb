class Price
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  def code
    raise 'Must implement by subclass'
  end

  def get_charge(days_rented)
    raise 'Must implement by subclass'
  end

  def get_frequent_renter_points(days_rented)
    1
  end
end

class RegularPrice < Price
  def code
    REGULAR
  end

  def get_charge(days_rented)
    this_amount = 0
    this_amount += 2
    if (days_rented > 2)
      this_amount += (days_rented - 2) * 1.5
    end
    this_amount
  end
end

class NewReleasePrice < Price
  def code
    NEW_RELEASE
  end

  def get_charge(days_rented)
    this_amount = 0
    this_amount += 3
    this_amount
  end

  def get_frequent_renter_points(days_rented)
    result = super
    # add bonus for a two day new release rental
    if (days_rented > 1)
      result += 1
    end
    result
  end
end

class ChildrenPrice < Price
  def code
    CHILDRENS
  end

  def get_charge(days_rented)
    this_amount = 0
    this_amount += 1.5
    if (days_rented > 3)
      this_amount += (days_rented - 1) * 1.5
    end
    this_amount
  end
end
