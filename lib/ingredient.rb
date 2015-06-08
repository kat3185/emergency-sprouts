require_relative 'conversions'

class Ingredient
  attr_reader :weight

  def initialize(weight)
    @weight = weight
  end

  def sprout_count
    weight / 20
  end

  def puff_count
    weight * 2
  end
end
