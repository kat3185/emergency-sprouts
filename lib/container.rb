require_relative 'conversions'

class Container

  attr_reader :weight, :ingredient_weight

  def initialize(ingredient_name, ingredient_weight)
    @ingredient_name = ingredient_name
    @ingredient_weight = ingredient_weight
    case @ingredient_name.downcase
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
    @ingredient_weight / 20
  end

end
