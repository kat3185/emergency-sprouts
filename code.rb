require_relative 'lib/airplane'
require_relative 'lib/container'
require_relative 'lib/ingredient'
require_relative 'lib/conversions'

@brussels_sprouts = Ingredient.new("brussels sprouts", 20)
@cheesy_poof = Ingredient.new("cheesy poof", 0.5)
@full_sprout_box = Container.new(@brussels_sprouts, lbs_to_grams(300))
@full_cheesy_box = Container.new(@cheesy_poof, lbs_to_grams(20))

def get_cheesy_poof_weight
  print "How many pounds of cheesy poofs do I have to transport? "
  lbs_to_grams(gets.chomp.to_f)
end

def box_cheesy_poofs(cheesy_poof_weight)
  cheesy_poof_cargo = []
  while cheesy_poof_weight > @full_cheesy_box.ingredient_weight
    cheesy_poof_cargo << Container.new(@cheesy_poof, @full_cheesy_box.ingredient_weight)
    cheesy_poof_weight -= @full_cheesy_box.ingredient_weight
  end
  cheesy_poof_cargo << Container.new(@cheesy_poof, cheesy_poof_weight)
end

def calc_avail_cargo_space(poof_boxes)
  concord = Airplane.new("concord")
  total_poof_weight = 0
  poof_boxes.each do |box|
    total_poof_weight += box.weight
  end
  @available_cargo_space = concord.capacity - total_poof_weight
end

def box_brussels_sprouts(available_cargo_space)
  boxes_of_sprouts = []
  sprout_weight = 0
  while available_cargo_space > @full_sprout_box.weight
    boxes_of_sprouts << Container.new(@brussels_sprouts, @full_sprout_box.ingredient_weight)
    available_cargo_space -= @full_sprout_box.weight
  end
  available_cargo_space -= @full_sprout_box.container_weight
  while available_cargo_space > @brussels_sprouts.weight
    available_cargo_space -= @brussels_sprouts.weight
    sprout_weight += @brussels_sprouts.weight
  end
  unless sprout_weight == 0
    boxes_of_sprouts << Container.new(@brussels_sprouts, sprout_weight)
  end
  boxes_of_sprouts
end

def sprout_container_count(boxes_of_sprouts)
  puts "We will be able to transport #{boxes_of_sprouts.count} boxes of brussels sprouts!"
end

def sprout_total(boxes_of_sprouts)
  sprouts = 0
  boxes_of_sprouts.each do |box|
    sprouts += box.sprout_count
  end
  puts "That means #{sprouts} sprouts!!"
end

def load_plane
  cheesy_poof_cargo = box_cheesy_poofs(get_cheesy_poof_weight)
  available_cargo_space = calc_avail_cargo_space(cheesy_poof_cargo)
  boxes_of_sprouts = box_brussels_sprouts(available_cargo_space)
  sprout_container_count(boxes_of_sprouts)
  sprout_total(boxes_of_sprouts)
end

load_plane
