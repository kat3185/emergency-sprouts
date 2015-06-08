require_relative 'lib/airplane'
require_relative 'lib/container'
require_relative 'lib/ingredient'
require_relative 'conversions'

def cheesy_poof_weight
  print "How many pounds of cheesy poofs would you like to transport?  "
  pounds = gets.chomp.to_f
  pounds * 453.592
end

def sprout_weight_capacity(concord, puff_weight)
  puff_container = Container.new(puff_weight * 2.5, puff_weight)
  sprout_weight = concord.capacity - puff_container.total_weight
  sprout_weight
end

def total_sprout_count(sprout_weight)
    sprout_container = Container.new(sprout_weight * 0.4, sprout_weight * 0.6)
    sprouts = Ingredient.new(sprout_container.ingredient_weight)
    sprouts.sprout_count.to_i
end

def print_sprout_info(sprout_count)
  sprout_container_count = sprout_count * 20 / 226796
  puts "You will have space on this plane for #{sprout_count} sprouts!"
  puts "These sprounts will require #{sprout_container_count} containers to transport!"
end

concord = Airplane.new(9071847.4)
poof_weight = cheesy_poof_weight
sprout_space = sprout_weight_capacity(concord, poof_weight)
sprout_count = total_sprout_count(sprout_space)
print_sprout_info(sprout_count)
