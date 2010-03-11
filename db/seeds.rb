# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

require 'morph'

tsv = IO.read 'data/officer_staff_level_public_complaints-officer_staff_allegations_recorded_behaviour_current_period.tsv'

groups = Morph.from_tsv tsv, 'PG'

groups.each do |group|
  group.percentage_change = group.percentage_change.chomp('%')
  group.name = group.name.sub('&','and')
  PoliceGroup.create group.morph_attributes
end
