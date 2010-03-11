class PoliceGroup < ActiveRecord::Base
  
  has_friendly_id :name, :use_slug => true, :strip_diacritics => true

  def rank
    groups = PoliceGroup.all.sort_by(&:grand_total)
    index = groups.index(self) + 1
    place = index / groups.size.to_f
    if place > 0.75
      'High'
    elsif place > 0.25
      'Moderate'
    else
      'Low'
    end
  end
end
