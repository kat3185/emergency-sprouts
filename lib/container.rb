require_relative 'conversions'
require_relative 'ingredient'

class Container

  attr_reader :weight, :ingredient_weight, :container_weight

  def initialize(ingredient_type, ingredient_weight)
    @ingredient_type = ingredient_type
    @ingredient_name = @ingredient_type.name
    @ingredient_weight = ingredient_weight
    case @ingredient_name
    when "brussels sprouts"
      @container_weight = lbs_to_grams(200)
    when "cheesy poof"
      @container_weight = lbs_to_grams(50)
    else
      puts "I have no idea what to put that ingredient in. You broke it!"
    end
    @weight = @ingredient_weight + @container_weight
  end

  def sprout_count
    (@ingredient_weight / 20).to_i
  end

end
