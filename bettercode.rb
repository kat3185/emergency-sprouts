require_relative 'lib/airplane'
require_relative 'lib/container'
require_relative 'lib/ingredient'
require_relative 'lib/conversions'
require 'pry'

@brussels_sprouts = Ingredient.new("brussels sprouts", 20)
@cheesy_poof = Ingredient.new("cheesy poof", 0.5)
@cheesy_ing_unboxed_weight = lbs_to_grams(20)
@full_sprout_box_weight = lbs_to_grams(500)
@sprout_ing_unboxed_weight = lbs_to_grams(300)
@sprout_empty_box_weight = lbs_to_grams(200)
@one_sprout = @brussels_sprouts.weight

def get_cheesy_poof_weight
  print "How many pounds of cheesy poofs do I have to transport? "
  lbs_to_grams(gets.chomp.to_f)
end

def box_cheesy_poofs(cheesy_poof_weight)
  cheesy_bundle = []
  while cheesy_poof_weight > @cheesy_ing_unboxed_weight
    cheesy_bundle << Container.new(@cheesy_poof, @cheesy_ing_unboxed_weight)
    cheesy_poof_weight -= @cheesy_ing_unboxed_weight
  end
  cheesy_bundle << Container.new(@cheesy_poof, cheesy_poof_weight)
  cheesy_bundle
end

def calc_avail_cargo_space(poof_boxes)
  concord = Airplane.new("concord")
  total_poof_weight = 0
  poof_boxes.each do |box|
    total_poof_weight += box.weight
  end
  avail_space = concord.capacity - total_poof_weight
  avail_space
end

def box_brussels_sprouts(avail_cargo_space)
  sprout_array = []
  sprout_weight = 0
  while avail_cargo_space > @full_sprout_box_weight
    sprout_array << Container.new(@brussels_sprouts, @sprout_ing_unboxed_weight)
    avail_cargo_space -= @full_sprout_box_weight
  end
  avail_cargo_space -= @sprout_empty_box_weight
  while avail_cargo_space > @one_sprout
    avail_cargo_space -= @one_sprout
    sprout_weight += @one_sprout
  end
  unless sprout_weight == 0
    sprout_array << Container.new(@brussels_sprouts, sprout_weight)
  end
  sprout_array
end

def sprout_container_count(victory)
  puts "We will be able to transport #{victory.count} boxes of brussels sprouts!"
end

def sprout_total(boxes_of_sprouts)
  sprouts = 0
  boxes_of_sprouts.each do |box|
    sprouts += box.sprout_count
  end
puts "That means #{sprouts} sprouts!!"

end

cheesy_poof_weight = get_cheesy_poof_weight
cheesy_poof_cargo_weight = box_cheesy_poofs(cheesy_poof_weight)
available_cargo_space = calc_avail_cargo_space(cheesy_poof_cargo_weight)
boxes_of_sprouts = box_brussels_sprouts(available_cargo_space)
sprout_container_count(boxes_of_sprouts)
sprout_total(boxes_of_sprouts)
