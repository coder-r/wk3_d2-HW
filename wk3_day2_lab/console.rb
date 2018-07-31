
#
# Create console.rb which
# will be used to create some new objects
# and practice your methods as required
# (use this as you are writing the class & methods to test them)

require('pry')
require_relative('models/bounty.rb')

bounty1 = Bounty.new(
  'name' => 'Jaba the Hutt',
  'favourite_weapon' => 'laser gun',
  'bounty_values' => 25,
  'danger_level' => 'medium'
)

bounty2 = Bounty.new(
  'name' => 'Thanos',
  'favourite_weapon' => 'The Infinity Gauntlet',
  'bounty_values' => 75,
  'danger_level' => 'ermagerdyerderd'
)
bounty3 = Bounty.new(
  'name' => 'The Borg',
  'favourite_weapon' => 'Borg Cube',
  'bounty_values' => 50,
  'danger_level' => 'high'
)

bounty1.save()

binding.pry

nil
