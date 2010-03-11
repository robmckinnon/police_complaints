class PoliceGroup < ActiveRecord::Base
  
  has_friendly_id :name, :use_slug => true, :strip_diacritics => true
  
end
