require_relative 'conversions'

class Airplane
  attr_reader :capacity

  def initialize(plane_type)
    case plane_type.downcase
    when 'concord'
      @capacity = lbs_to_grams(20000)
    else
      "That is definitely not a plane. I hate you."
    end
  end

end
